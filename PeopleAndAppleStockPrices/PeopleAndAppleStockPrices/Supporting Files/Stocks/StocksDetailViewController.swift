//
//  StocksDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Amy Alsaydi on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksDetailViewController: UIViewController {
    
    @IBOutlet weak var thumbLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    
    var stock: Stock?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        guard let theStock = stock else {
            fatalError("could get stock, check segue")
        }
        
        if theStock.change > 0 {
            view.backgroundColor = .green
            thumbLabel.text = "👍🏼"
        } else
        {
          view.backgroundColor = .red
           thumbLabel.text = "👎🏼"
        }
        date.text = "Date: \(theStock.label)"
        openLabel.text = "Opening Price: \(theStock.uOpen)"
        closeLabel.text = "Closing Price: \(theStock.uClose)"
        
    }
    

}
