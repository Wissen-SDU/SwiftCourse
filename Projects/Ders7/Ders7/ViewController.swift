//
//  ViewController.swift
//  Ders7
//
//  Created by Suleyman Calik on 30.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        println("1")
        let queue = dispatch_queue_create("com.test.loopQueue", nil)
        dispatch_async(queue) { () -> Void in
            while true {
                println("2")
            }
        }
        while true {
            println("3")
        }
        
        
        
    }
    
    func control() {
        let queue = dispatch_queue_create("com.test.afterQueue", nil)
        dispatch_after(10000000000, queue) { () -> Void in
            // servera bak
            self.control()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

