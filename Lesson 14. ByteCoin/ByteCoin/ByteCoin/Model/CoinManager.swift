//
//  coinManager.swift
//  ByteCoin
//
//  Created by User on 29.11.2023.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinData)
    func didFailWithError(error: Error)
}
struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "5165DA0D-371F-47EC-A37D-CF4DAEB39223"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }
                if let safeData = data {
                    if let coin = parseJSON(safeData) {
                    print(coin)
                         self.delegate?.didUpdateCoin(self, coin: coin)
                    }
                }
            })
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> CoinData? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CoinData.self, from: data)
            let lastPrise = decodeData.rate
            let coin = CoinData(rate: lastPrise)
            return coin
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
