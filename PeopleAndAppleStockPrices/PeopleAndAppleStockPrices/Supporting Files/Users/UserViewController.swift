//
//  UserViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Amy Alsaydi on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()

    }
    
    func loadData() {
        let filename = "userinfo"
        let ext = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        
        users = User.getUsers(from: data)
        
        //users = users.sort(by: {$0.})
        
        
    }

}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let user = users[indexPath.row]
        
        let userName = "\(user.name.first.capitalized) \(user.name.last.capitalized)"
        let userAddress = "\(user.location.street) \(user.location.city), \(user.location.state) \(user.location.postcode)"
        
        cell.textLabel?.text = userName
        cell.detailTextLabel?.text = userAddress
        
        return cell
    }
    
    
}
