//
//  UserDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Amy Alsaydi on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
       var user: User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        title = "User" 
        
    }
    
    func updateUI() {
        
        guard let selectedUser = user else {
            fatalError("couldnt get user, check segue")
        }
        
        nameLabel.text = selectedUser.fullName.capitalized
        dobLabel.text = selectedUser.dob
        
        addressLabel.text = "Address: \(selectedUser.fullAddress.capitalized)"
        emailLabel.text = "Email: \(selectedUser.email)"
        phoneLabel.text = "Phone: \(selectedUser.phone)" 
    }


}


