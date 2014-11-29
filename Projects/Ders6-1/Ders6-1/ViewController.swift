//
//  ViewController.swift
//  Ders6-1
//
//  Created by Suleyman Calik on 29.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var textView = UITextView(frame:view.bounds)
        var appDel = UIApplication.sharedApplication().delegate as AppDelegate
        textView.text = appDel.pushNotification?.description
        view.addSubview(textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

