//
//  WeatherManager.swift
//  Clima
//
//  Created by User on 24.11.2023.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=ef63c03b91fbb3ff7cbceba58f9983e6&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // Step 1. Create a URL
        if let url = URL(string: urlString) {
            // Step 2. Create a URLSession
            let session = URLSession(configuration: .default)
            // Step 3. Give the session task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = parseJSON(safeData) {
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                 }
            }
                //Step 4. Start the task
                task.resume()
                
            }
            
        }
        func parseJSON(_ weatherData: Data) -> WeatherModel? {
            let decorder = JSONDecoder()
            do {
                let decodedData = try decorder.decode(WeatherData.self, from: weatherData)
                let id = decodedData.weather[0].id
                let temp = decodedData.main.temp
                let name = decodedData.name
                
                let weather = WeatherModel(conditionalId: id, cityName: name, temperature: temp)
                return weather
            } catch {
                delegate?.didFailWithError(error: error)
                return nil
            }
            
        }
        
}

