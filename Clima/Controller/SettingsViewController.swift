//
//  SettingsViewController.swift
//  Clima
//
//  Created by lukasio on 07/10/2025.
//

import UIKit
protocol SettingsDelegate: AnyObject {
    func didChangeTemperatureUnit()
}

class SettingsViewController: UIViewController {
    weak var delegate: SettingsDelegate?

    @IBOutlet weak var temperatureSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var themeSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "isCelsius") == nil {
            // Key doesn't exist yet — set default to true
            UserDefaults.standard.set(true, forKey: "isCelsius")
        }

        let isCelsius = UserDefaults.standard.bool(forKey: "isCelsius")
               temperatureSegmentedControl.selectedSegmentIndex = isCelsius ? 0 : 1
    }
    
    @IBAction func temperatureChanged(_ sender: UISegmentedControl) {
        let isCelsius = sender.selectedSegmentIndex == 0
        UserDefaults.standard.set(isCelsius, forKey: "isCelsius")
        // Notify delegate
          delegate?.didChangeTemperatureUnit()
        
        // Haptic feedback
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        delegate?.didChangeTemperatureUnit()
        dismiss(animated: true)
    }
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.didChangeTemperatureUnit()
        dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
