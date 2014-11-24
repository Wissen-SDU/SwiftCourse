// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var autoInt = 10
var manuelInt:Int = 10

var autoDouble = 10.0
var manuelDouble:Double = 10.0


//println( "TypeName0 = \(_stdlib_getTypeName(myDouble))")


var mustakbelSayi = "123"
var cevrilenSayi = mustakbelSayi.toInt()

//autoInt = cevrilenSayi!


// Optinal kontrolu yontem 1 (optional binding)
if let gercekSayi = cevrilenSayi {
    println("GERCEK SAYI: \(gercekSayi)")
}
else {
    println("SAYI DEGIL!!!")
}



// Optional kontrolu yontem 2
if (cevrilenSayi != nil) && true {
    println("CEVRILEN SAYI: \(cevrilenSayi!)")
}
else {
    println("SAYI DEGIL!!!")
}





// Toplama Operatoru

var text1 = "selam"
var text2 = "millet"


var text3 = text1 + " " + text2

var text4 = text3 + String(10)


text1 += text2
text1


var sdü = 1345

















