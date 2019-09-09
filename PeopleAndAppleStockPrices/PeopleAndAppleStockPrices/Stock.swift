//
//  Stock.swift
//  PeopleAndAppleStockPrices
//
//  Created by David Rifkin on 9/9/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Stock: Codable {
    private let date: String
    let opening: Double
    let closing: Double
    var day: String {
        return date.components(separatedBy: "-")[2]
    }
    var month: String {
        return date.components(separatedBy: "-")[1]
    }
    var year: String {
        return date.components(separatedBy: "-")[0]
    }
    
    private enum CodingKeys: String, CodingKey {
        case date
        case opening = "open"
        case closing = "close"
    }

    static func getStocks() -> [Stock] {
        
        guard let fileName = Bundle.main.path(forResource: "applstockinfo", ofType: "json") else {fatalError()}
        let fileURL = URL(fileURLWithPath: fileName)
        do {
            let data = try Data(contentsOf: fileURL)
            let stocks = try JSONDecoder().decode([Stock].self, from: data)
            return stocks
        } catch {
            fatalError()
        }
    }
}
