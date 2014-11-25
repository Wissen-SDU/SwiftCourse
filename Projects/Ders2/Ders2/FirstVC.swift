//
//  FirstVC.swift
//  Ders2
//
//  Created by Suleyman Calik on 25.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {


    @IBAction func backToFirst(segue:UIStoryboardSegue) {
        println("backToFirst cagrildi!")
    }

    @IBAction func buttonTapped(sender: AnyObject) {
        
        performSegueWithIdentifier("FirstToSecond", sender:nil)
        
    }
}
