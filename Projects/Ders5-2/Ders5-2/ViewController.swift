//
//  ViewController.swift
//  Ders5-2
//
//  Created by Suleyman Calik on 28.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        login()

    }


    
    func login() {
        
        SDUService.sharedService().login("x@x.com", password: "123456", userType: 1) { (dict) -> Void in
            
            if let dictionary = dict {
                var resultStr = dictionary["KimlikGirisJsonResult"] as String
                var data = resultStr.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
                if let dictData = data {
                    var resultDict = NSJSONSerialization.JSONObjectWithData(dictData, options: NSJSONReadingOptions.allZeros, error: nil) as Dictionary<String,AnyObject>
                    var sonucDict = resultDict["Sonuc"] as Dictionary<String,AnyObject>
                    var tc = sonucDict["TCKimlikNo"] as String
                    var name = sonucDict["AdSoyad"] as String
                    
                    println("tc: \(tc) isim:\(name)")
                }
//                println(resultDict)
            }
            else {
                println("SONUC GELMEDI!")
            }
        }
    }

}







