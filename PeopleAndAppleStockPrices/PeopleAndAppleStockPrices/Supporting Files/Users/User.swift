//
//  User.swift
//  PeopleAndAppleStockPrices
//
//  Created by Amy Alsaydi on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct UserData: Decodable {
    let results: [User]
}

struct User: Decodable  {
    let name: Name
    let location: Location
    var fullName: String {return name.first + " " + name.last}
    
}

struct Name: Decodable  {
    let title: String
    let first: String
    let last: String
}

struct Location: Decodable  {
    let street: String
    let city: String
    let state: String
    let postcode: String
}


extension User {
    static func getUsers(from data: Data) -> [User] {
        var users = [User]()
        
        do {
            let userData = try JSONDecoder().decode(UserData.self, from: data)
            users = userData.results
        } catch {
            fatalError("decoding error:\(error)") // returns nil
        }
        
        
     return users
    }
}
