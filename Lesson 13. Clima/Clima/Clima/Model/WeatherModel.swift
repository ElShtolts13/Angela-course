//
//  WeatherModel.swift
//  Clima
//
//  Created by User on 25.11.2023.
//

import Foundation

struct WeatherModel {
    let conditionalId: Int
    let cityName: String
    let temperature: Double
    
    var stringTemp: String {
        String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
       switch conditionalId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 700...781:
            return "smoke.fill"
        case 800:
            return "sun.max.fill"
        case 801...804:
            return "cloud.sun.fill"
        default:
            return "sun.max"
        }
    }

}
