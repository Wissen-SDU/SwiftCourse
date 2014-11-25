//
//  SecondVC.swift
//  Ders2
//
//  Created by Suleyman Calik on 25.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class SecondVC : UIViewController {
    
    var username:String?
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var txtUsername: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("username: \(username)")
        
        lblUsername.text = username
        txtUsername.text = username
        txtUsername.hidden = true
    }
    
    
    // MARK: - Action Methods

    @IBAction func editButtonTapped(sender: UIButton) {
        
        if txtUsername.hidden {
            // Duzenleme Moduna geciyoruz
            sender.setTitle("Vazgec", forState:UIControlState.Normal)
            txtUsername.hidden = false
            lblUsername.hidden = true
            txtUsername.becomeFirstResponder()
        }
        else {
            // Normal Moda geciyoruz
            sender.setTitle("Duzenle", forState:UIControlState.Normal)
            txtUsername.hidden = true
            lblUsername.hidden = false
            txtUsername.resignFirstResponder()
        }
    }
    
    
    @IBAction func textChanged(sender: UITextField) {
        username = txtUsername.text
        lblUsername.text = username
    }
    
    
    
}






