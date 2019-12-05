//
//  StocksViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Amy Alsaydi on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var stocks = [Stock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()

    }
    
    func loadData() {
        let filename = "applstockinfo"
        let ext = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        stocks = Stock.getStocks(from: data)
    }
}

extension StocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let stock = stocks[indexPath.row]
        
        cell.textLabel?.text = stock.date
        cell.detailTextLabel?.text = stock.uOpen.description
        
        
        return cell
    }
    
    
}
