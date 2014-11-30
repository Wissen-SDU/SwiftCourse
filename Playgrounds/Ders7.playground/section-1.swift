// Playground - noun: a place where people can play

import UIKit

var dizi = ["1" , "2"]


func degistir(inout dizi:Array<String>) {
    
     dizi[0] = "0"
}

degistir(&dizi)
dizi



var dizi2 = dizi

dizi2[0] = "A"

dizi
dizi2




var nsDizi1 = NSMutableArray(array: [0,1])
var nsDizi2 = nsDizi1
nsDizi2[0] = 100


nsDizi1
nsDizi2


func degistir2(var dizi:NSMutableArray) {
    dizi[0] = 1000
}


degistir2(nsDizi1)
nsDizi1






