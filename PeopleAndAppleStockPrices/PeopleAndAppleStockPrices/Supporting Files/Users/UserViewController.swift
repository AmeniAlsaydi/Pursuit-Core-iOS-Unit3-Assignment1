//
//  UserViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Amy Alsaydi on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var searchQuery = "" {
        didSet {
            let filename = "userinfo"
            let ext = "json"
            let data = Bundle.readRawJSONData(filename: filename, ext: ext)
            
            users = User.getUsers(from: data).sorted(by: {$0.name.first < $1.name.first}).filter {$0.fullName.lowercased().contains(searchQuery.lowercased())}

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        searchBar.delegate = self

    }
    
    func loadData() {
        let filename = "userinfo"
        let ext = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        
        users = User.getUsers(from: data)
        users = users.sorted(by: {$0.name.first < $1.name.first})
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? UserDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Couldnt get detailVC or indexPath")
        }
        detailVC.user = users[indexPath.row]
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
        cell.detailTextLabel?.text = userAddress.capitalized
        
        return cell
    }
    
    
}

extension UserViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // dismiss the keyboard
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            loadData()
            return
        }
        
        searchQuery = searchText
        
    }
    
    
    
}
