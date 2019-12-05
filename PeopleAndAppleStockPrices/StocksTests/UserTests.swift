//
//  StocksTests.swift
//  StocksTests
//
//  Created by Amy Alsaydi on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest

@testable import PeopleAndAppleStockPrices

class UserTests: XCTestCase {
    
    // arrange
    let filename = "userinfo"
    let ext = "json"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testParseJSONToUsersArray() {
        // arrange
       
        // act
        let users = getUsers()
        
        // asserts
        XCTAssertGreaterThan(users.count, 0, "users should be greater than 0")

    }
}

extension UserTests {
    func getRawData() -> Data {
        return Bundle.readRawJSONData(filename: filename, ext: ext)
    }
    
    func getUsers() -> [User] {
        let data = getRawData()
        return User.getUsers(from: data)
    }
    
}
