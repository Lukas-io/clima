//
//  WeatherManager.swift
//  Clima
//
//  Created by lukasio on 07/10/2025.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weather : WeatherModel)
    func didFailWithError(_ error : Error)
}

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=3b9d591cb1cc7a9399bfbf44df8430e5&units=metric"
    
    var delegate : WeatherManagerDelegate?
    
    func fetchWeather(cityName : String){
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude lat : CLLocationDegrees, longitude lon : CLLocationDegrees){
        let urlString = "\(weatherUrl)&lat=\(lat)&lon=\(lon)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString : String){
       
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data {
                 
                    if let weather = self.parseJson(safeData){
                        
                        self.delegate?.didUpdateWeather(weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
          let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
          
            print(decodedData)
            
            let temp = decodedData.main.temp
            let name = decodedData.name
            let id = decodedData.weather[0].id
            
            let weather = WeatherModel(cityName: name, temperature: temp, conditionId: id)
            return weather
            
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
   
    
}

