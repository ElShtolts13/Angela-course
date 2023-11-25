//
//  WeatherData.swift
//  Clima
//
//  Created by User on 25.11.2023.
//

import Foundation
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}
struct Weather: Codable {
    let id: Int
}
