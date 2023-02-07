//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
protocol didUpdateCoinDelegate {
    func updateCoin(coin:CoinModel)
}
struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "210CD630-DFAF-43C0-AC39-EDC9461C4765"
    var delegate : didUpdateCoinDelegate?
    
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency : String) {
        let url = URL(string: "\(baseURL)/\(currency)?apikey=\(apiKey)")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) {data,response,error in
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data {
                if let decodedData = parseJSON(coinData: safeData){
                    delegate?.updateCoin(coin: decodedData)
                }
            }
        }
        task.resume()
    }
    func parseJSON(coinData:Data) -> CoinModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let coinValue = decodedData.rate
            let coinName = decodedData.asset_id_quote
            print(coinValue)
            
            let coin = CoinModel(coinValue: coinValue,coinName: coinName)
            return coin
        }catch{
            print(error)
            return nil
        }
    }
}

