//
//  ViewController.swift
//  Ders1
//
//  Created by Suleyman Calik on 24.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var txtName: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWelcome.text = ""
    }

    @IBAction func buttonTapped(sender: UIButton) {
        lblWelcome.text = "Hosgeldin: \(txtName.text)"
    }

    
    
    func deneme() {
        var selamDegeri = selam()
        print(selamDegeri)
    }
    


}

