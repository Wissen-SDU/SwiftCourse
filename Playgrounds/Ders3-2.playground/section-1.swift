// Playground - noun: a place where people can play

import UIKit

protocol IkiIslem {
    
    func sayiyaCevir(text:String, inout error: String?) -> Int?
    func topla(sayi sayi1:Int , sayi2:Int) -> Int
    func cikar(sayi1:Int , sayi2:Int) -> Int
    
}


class Matematik <T> : IkiIslem {
    
    
    // MARK: - IkiIslem Methods
    
    func temp(nesne:T) -> T {
        return nesne
    }
    
    func sayiyaCevir(text: String, inout error: String?) -> Int? {
        
        if let sayi = text.toInt() {
            error = nil
            return sayi
        }
        else {
            error = "Alfanumerik yazi geldi!"
            return Int(INT16_MIN)
        }
    }
    
    func cikar(sayi1: Int, sayi2: Int) -> Int {
        return sayi1 - sayi2
    }
    
    func topla(sayi sayi1: Int, sayi2: Int) -> Int {
        return sayi1 + sayi2
    }
    
    
    
}


var math = Matematik<Int>()
var oniki = math.topla(sayi:10, sayi2: 2)
var sekiz = math.cikar(10, sayi2: 2)

var error:String?
var sayiMi = math.sayiyaCevir("123as", error: &error)

if error == nil {
    print("cevrildi: \(sayiMi)")
}
else {
    print("cevrilemedi: \(error!)")
}







// GENERICLER

func tekrarla<T>(nesne:T , tekrar:Int) -> [T] {

    var dizi = Array<T>()
    
    for i in 0...tekrar {
        dizi.append(nesne)
    }
    
    return dizi
}


func tipiniSoyle<T>(nesne:T) -> String {
    
    switch nesne {
    case is String:
        return "String"
    case is Int:
        return "Integer"
    default:
        return "Bilmiyorum!"
    }
}


tipiniSoyle("asdfg")
tipiniSoyle(12345)
tipiniSoyle(true)








