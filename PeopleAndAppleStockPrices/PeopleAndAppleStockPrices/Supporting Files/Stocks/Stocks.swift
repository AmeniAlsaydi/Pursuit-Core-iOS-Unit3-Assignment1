//
//  Stocks.swift
//  PeopleAndAppleStockPrices
//
//  Created by Amy Alsaydi on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Stock: Decodable {
    let date: String
    let uOpen: Double
    
    // this is used to populate the table view
    static func getStocks(from data: Data) -> [Stock] {
        var stocks = [Stock]()
        
        do {
            let stockData = try JSONDecoder().decode([Stock].self, from: data)
            stocks = stockData
        } catch {
            fatalError("decoding error: \(error)")
        }
        return stocks
    }
}
