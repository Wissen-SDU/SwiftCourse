//
//  User.swift
//  Ders5-1
//
//  Created by Suleyman Calik on 28.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import Realm

class User: RLMObject {
   
    dynamic var id:String = ""
    dynamic var first_name:String = ""
    dynamic var last_name:String = ""
    dynamic var username:String = ""
    dynamic var name:String = ""
    dynamic var gender:String = ""
    dynamic var locale:String = ""
    
    override class func primaryKey() -> String! {
        return "id"
    }
    
}
