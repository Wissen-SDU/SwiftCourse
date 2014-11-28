//
//  SecondViewController.swift
//  Ders5-1
//
//  Created by Suleyman Calik on 28.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import Realm

class SecondViewController: UIViewController, UITableViewDataSource {

    var users:RLMResults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users = User.allObjects()
        
        var tableView = UITableView(frame: view.bounds, style: UITableViewStyle.Plain)
        tableView.dataSource = self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        
        view.addSubview(tableView)
    }


    // MARK: TableView Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(users.count)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("UserCell") as UITableViewCell
        var user:User = users[UInt(indexPath.row)] as User
        cell.textLabel.text = user.name
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        
        var user = users[UInt(indexPath.row)] as User
        realm.deleteObject(user)
        
        realm.commitWriteTransaction()

        tableView.reloadData()
    }

}






