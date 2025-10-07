//
//  ViewController.swift
//  Clima
//
//  Created by lukasio on 07/10/2025.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController{
    
    
    @IBOutlet weak var actvityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var searchField: UISearchBar!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Location button pressed")
        searchField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        updateDateTime()
        // Update time every minute
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            self?.updateDateTime()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSettings",
           let settingsVC = segue.destination as? SettingsViewController {
               settingsVC.delegate = self
           }
       }
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        didChangeTemperatureUnit()
//    }
}


//MARK: - Set Time and Date

extension WeatherViewController: SettingsDelegate{
    
    
   
    func didChangeTemperatureUnit() {
        // Safely get the number from the label (if it exists)
        guard let text = temperatureLabel.text,
              let value = Double(text.filter("0123456789.-".contains)) else {
            return
        }
        
        // Format and update
        temperatureLabel.text = formatTemperature(value)
    }
    
    
    func formatTemperature(_ tempInCelsius: Double) -> String {
        
        if UserDefaults.standard.object(forKey: "isCelsius") == nil {
            // Key doesn't exist yet — set default to true
            UserDefaults.standard.set(true, forKey: "isCelsius")
        }
        let isCelsius = UserDefaults.standard.bool(forKey: "isCelsius")
        
        if isCelsius {
            return String(format: "%.1f", tempInCelsius)
        } else {
            let tempInFahrenheit = tempInCelsius * 9/5 + 32
            return String(format: "%.1f", tempInFahrenheit)
        }
    }
    
    
    func updateDateTime() {
        let dateFormatter = DateFormatter()
        
        // Format for date: "Tue 07 Oct"
        dateFormatter.dateFormat = "EEE dd MMM"
        dateLabel.text = dateFormatter.string(from: Date())
        
        // Format for time: "10:18 am"
        dateFormatter.dateFormat = "hh:mm a"
        timeLabel.text = dateFormatter.string(from: Date())
    }
}


//MARK: - UISearchFieldDelegate Delegate
extension WeatherViewController : UISearchBarDelegate{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        if let city = searchBar.text, !city.isEmpty {
            weatherManager.fetchWeather(cityName: city)
            self.actvityIndicator.startAnimating()
            
        }
        searchBar.text = ""
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        if searchBar.text != "" {
            return true
        } else {
            searchBar.placeholder = "Search city"
            return false
        }
    }
    
    
}


//MARK: - Weather Manger Delegate
extension WeatherViewController : WeatherManagerDelegate{
    
    func didUpdateWeather(_ weather: WeatherModel) {
        DispatchQueue.main.async {
            
            UIView
                .transition(
                    with: self.view,
                    duration: 0.3,
                    options: .curveEaseOut,
                    animations: {
                        self.cityLabel.text = weather.cityName
                        self.temperatureLabel.text = self.formatTemperature(weather.temperature)
                        self.conditionImageView.image = UIImage(systemName: weather.conditionName)
                        self.weatherDescription.text = weather.conditionDescription
                    })
            self.actvityIndicator.stopAnimating()
            self.locationButton.isEnabled = true
        }
    }
    func didFailWithError(_ error: any Error) {
        DispatchQueue.main.async {
            self.actvityIndicator.stopAnimating()
            self.locationButton.isEnabled = true
            
            // Show error alert
            let alert = UIAlertController(title: "City not found",
                                          message: "Unable to find that location. Please try again.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
        print(error)
    }
}

//MARK: - Location Manager Delegate
extension WeatherViewController : CLLocationManagerDelegate {
    @IBAction func locatioonPressed(_ sender: UIButton) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        sender.isEnabled = false // Disable button
        actvityIndicator.startAnimating()
        print("Location button pressed")
        locationManager.requestLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        self.actvityIndicator.stopAnimating()
        self.locationButton.isEnabled = true
        print(error)
    }
    
    
}
