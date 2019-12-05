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
    var stockInSections = [[Stock]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        getSessions(of: stocks)

    }
    
    func loadData() {
        let filename = "applstockinfo"
        let ext = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        stocks = Stock.getStocks(from: data)
    }
    
    
    func getSessions(of data: [Stock]) { // this should return // [[Stock]]
        
        let sortedStocks = data.sorted { $0.date < $1.date}
        var sectionNames: Set<String> = Set(sortedStocks.map{$0.date})
        var removedDaysArray = [String]()
        
        var sections: [[Stock]]
        
        for stock in sectionNames {
            var removedDashesStock = stock.components(separatedBy: "-")
            removedDashesStock.removeLast()
            removedDaysArray.append(removedDashesStock.joined(separator: " "))
        }
        sectionNames = Set(removedDaysArray)
              
        let sectionNamesAsArr = Array(sectionNames).sorted()
               
        
        sections = Array(repeating: [Stock](), count: sectionNames.count)

        var currentIndex = 0
        var sectionIndex = 0
        var currentSection = sectionNamesAsArr[sectionIndex]

        for stock in sortedStocks {
            var date = stock.date.components(separatedBy: "-")
            date.removeLast()
            let removedDayDate = date.joined(separator: " ")

            if removedDayDate == currentSection {
                sections[currentIndex].append(stock)

            } else {
                currentIndex += 1
                sectionIndex += 1
                currentSection = sectionNamesAsArr[sectionIndex]
                sections[currentIndex].append(stock)
            }

        }

        stockInSections = sections
    }
    
    // this function given a sction of Stocks will return the average
    func getAverage(for section: [Stock]) -> Double {
        
        var sum = 0.0
        
        for stock in section {
            sum += stock.uOpen
        }
        
        let average = sum/Double(section.count)
        return average
    }
}

extension StocksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockInSections[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let stock = stockInSections[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = stock.date
        cell.detailTextLabel?.text = stock.uOpen.description
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stockInSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        guard let stock = stockInSections[section].first?.label.components(separatedBy: " ") else {return " " }
        
        let average = getAverage(for: stockInSections[section])
        let formatedAverage = String(format: "%.2f", average)
        
        
        let title = "\(stock[0]) - \(stock[2])    Average: \(formatedAverage)"
        return title
        
    }
    
}
