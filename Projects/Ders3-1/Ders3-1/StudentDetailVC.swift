//
//  StudentDetailVC.swift
//  Ders3-1
//
//  Created by Suleyman Calik on 26.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class StudentDetailVC: UIViewController {
    
    var student:ViewController.Student?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = student?.fullName()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
