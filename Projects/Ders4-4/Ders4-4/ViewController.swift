//
//  ViewController.swift
//  Ders4-4
//
//  Created by Suleyman Calik on 27.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        
        var alarmVC = self.storyboard!.instantiateViewControllerWithIdentifier("AlarmVC") as AlarmVC
        self.navigationController?.pushViewController(alarmVC, animated: true)
        
    }

}






