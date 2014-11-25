//
//  FirstVC.swift
//  Ders2
//
//  Created by Suleyman Calik on 25.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    
    
    // MARK: - Action Methods
    
    @IBAction func backToFirst(segue:UIStoryboardSegue) {
        println("backToFirst cagrildi!")
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        if txtUsername.text.isEmpty {
            // kullaniciya alert popup goster
        }
        else {
            performSegueWithIdentifier("FirstToSecond", sender:nil)
        }
    }
    
    
    // MARK: - Navigation Methods
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is SecondVC {
            var secondScreen = segue.destinationViewController as SecondVC
            secondScreen.username = txtUsername.text
        }
    }
    
}


