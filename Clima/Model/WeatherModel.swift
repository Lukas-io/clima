//
//  WeatherModel.swift
//  Clima
//
//  Created by lukasio on 07/10/2025.
//

import Foundation

struct WeatherModel {
    let cityName : String
    let temperature : Double
    let conditionId : Int
    
    
    var temperatureString : String{
        return String(format: "%.1f", temperature)
    }
    var conditionDescription: String {
        return getConditionDescription(conditionId)
    }

    func getConditionDescription(_ conditionID: Int) -> String {
        switch conditionID {
        case 200...232:
            return "Thunderstorm"
        case 300...321:
            return "Drizzle"
        case 500...531:
            return "Rainy"
        case 600...622:
            return "Snowy"
        case 701...781:
            return "Foggy"
        case 800:
            return "Sunny"
        case 801...804:
            return "Cloudy"
        default:
            return "Clear"
        }
    }
    
    var conditionName : String {
        return getCondtionName(conditionId)
    }
    
    func getCondtionName(_ conditionID : Int) -> String{
        switch conditionID {
                case 200...232:
                    return "cloud.bolt.fill"
                case 300...321:
                    return "cloud.drizzle.fill"
                case 500...531:
                    return "cloud.rain.fill"
                case 600...622:
                    return "cloud.snow.fill"
                case 701...781:
                    return "cloud.fog.fill"
                case 800:
                    return "sun.min.fill"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }

    }
    
    
}
