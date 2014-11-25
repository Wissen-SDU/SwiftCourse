// Playground - noun: a place where people can play

import UIKit

/////////////////////
struct UserStruct {
    var name:String
}

var structUserA = UserStruct(name: "Suleyman")
var structUserB = structUserA

structUserA
structUserB

structUserB.name = "Murat"


structUserA
structUserB

//////////////////////

class UserClass {
    var name:String
    
    init(name:String) {
        self.name = name
    }
}


var classUserA = UserClass(name: "Suleyman")
var classUserB = classUserA

classUserA
classUserB

classUserB.name = "Murat"

classUserA
classUserB


