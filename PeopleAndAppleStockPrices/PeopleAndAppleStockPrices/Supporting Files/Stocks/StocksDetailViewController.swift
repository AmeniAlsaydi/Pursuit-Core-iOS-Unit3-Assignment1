//
//  StocksDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Amy Alsaydi on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
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
        date.text = theStock.label
        openLabel.text = theStock.uOpen.description
        
    }
    

}
