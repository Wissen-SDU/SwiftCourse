//
//  FirstVC.swift
//  Ders2
//
//  Created by Suleyman Calik on 25.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class FirstVC: UIViewController , UIAlertViewDelegate {
    
    @IBOutlet weak var txtUsername: UITextField!
    
    
    // MARK: - Action Methods
    
    @IBAction func backToFirst(segue:UIStoryboardSegue) {
        if segue.sourceViewController is SecondVC {
            var secondScreen:SecondVC = segue.sourceViewController as SecondVC
            txtUsername.text = secondScreen.username
        }
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        if txtUsername.text.isEmpty {
            var alertView = UIAlertView(title: "Hata", message: "Mesaj", delegate: self, cancelButtonTitle: "Vazgec", otherButtonTitles: "Tamam gireyim", "Offf")
            alertView.show()
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
    
    
    
    // MARK: - Alertview Methods
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        println("index: \(buttonIndex)")
    }
    
    
}


