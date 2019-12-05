//
//  StocksTests.swift
//  StocksTests
//
//  Created by Amy Alsaydi on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest

@testable import PeopleAndAppleStockPrices

class StocksTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParseJSONToStocksArray() {
        //arrange
        let filename = "applstockinfo"
        let ext = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        
        // act
        let stocks = Stock.getStocks(from: data)
        
        // assert
        XCTAssertGreaterThan(stocks.count, 0, "stocks should be greater than 0")
        
    }

}
