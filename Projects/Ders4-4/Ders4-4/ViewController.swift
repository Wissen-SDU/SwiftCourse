//
//  ViewController.swift
//  Ders4-4
//
//  Created by Suleyman Calik on 27.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit


var alarms = Array<Alarm>()


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collection.dataSource = self
        collection.delegate = self
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        collection.reloadData()
    }

    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        
        var alarmVC = self.storyboard!.instantiateViewControllerWithIdentifier("AlarmVC") as AlarmVC
        self.navigationController?.pushViewController(alarmVC, animated: true)
    }
    
    
    // MARK: CollectionView Methods
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alarms.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = collection.dequeueReusableCellWithReuseIdentifier("AlarmCell", forIndexPath: indexPath) as UICollectionViewCell
        
        return cell
    }
    

}






