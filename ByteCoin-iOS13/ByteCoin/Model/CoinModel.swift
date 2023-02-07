//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Mahammad Afandiyev on 28.11.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
struct CoinModel {
    let  coinValue : Double
    let coinName : String
    
    var coinValueString : String {
        return String(format: "%.2f", coinValue)
    }
}
