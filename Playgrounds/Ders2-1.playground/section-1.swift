// Playground - noun: a place where people can play

import UIKit


// Array'ler

var bosArray:Array<Int> = Array<Int>()
bosArray.append(12)
bosArray.append(123)

var doluArray:Array<Float> = [1,2,3,1,3,6]
var doluArrayCount = doluArray.count

if let ilkEleman:Float = doluArray.first {
    ilkEleman
}
else {
    "array bos"
}


var ucuncu = doluArray[2]

if doluArray.count > 9 {
    var onuncu = doluArray[9]
}


for sayi in doluArray {
    sayi
}


var removedNumber = doluArray.removeLast()

doluArray

doluArray.removeAtIndex(3)

doluArray

doluArray.removeRange(1...3)


//range 1..<3  3 dahil degil
//range 1...3 3 dahil


for sayi in 100..<100 {
    sayi
}


for var i:Double = 0 ; i < 1 ; i++ {
    i
}




doluArray.removeAll(keepCapacity: false)





// Dictionary'ler


var ogrenciBilgileri = Dictionary<String,String>()
ogrenciBilgileri["Ad"] = "Suleyman"
ogrenciBilgileri.count


ogrenciBilgileri["Ad"] = "Hasan"
ogrenciBilgileri


ogrenciBilgileri.updateValue("Suleyman", forKey: "Ad")

ogrenciBilgileri.updateValue("Calik", forKey: "Soyad")

ogrenciBilgileri
//ogrenciBilgileri.removeValueForKey("Ad")


for (key,value) in ogrenciBilgileri {
    key + " = " + value
}


ogrenciBilgileri






// Fonksiyonlar


func merhabaDe() {
    println("merhaba!")
}

merhabaDe()


func merhabaDe(isim:String) {
    println("merhaba: \(isim)")
}

merhabaDe("suleyman")


func merhabaDe(sayi:Int) {
    println("\(sayi) kere merhaba")
}

merhabaDe(10)


func birseySoyle(birsey:String , sayi:Int) {
    println("\(sayi) kere \(birsey)")
}
birseySoyle("selam", 3)



func birseySoyle2(var birsey:String , var kacKere sayi:Int) {
    
    birsey += ":)"
    sayi++
    println("\(sayi) kere \(birsey)")
}
birseySoyle2("selam", kacKere:3)



func topla(sayi1:Int, sayi2:Int) -> Int {
    return sayi1 + sayi2
}


func ikiyeBol(sayi:Float) -> (Float,Float) {
    var bolum = sayi / 2
    var kalan = sayi % 2
    
    return (bolum,kalan)
}


// Tuple'lar
var (bolum,kalan) = ikiyeBol(9)
bolum
kalan


var bolumVeKalan = ikiyeBol(9)
bolumVeKalan.0
bolumVeKalan.1


// Class'lar


class Biskuvi {
    var marka:String = "Ulker"
}

var biskuvim = Biskuvi()
biskuvim.marka = "Eti"


class User {
    var firstName:String
    var lastName:String
    var gender:String?
    
    init(ad:String , lastName:String) {
        firstName = ad
        self.lastName = lastName
    }
    
    convenience init(ad:String , lastName:String , gender:String) {
        self.init(ad:ad,lastName:lastName)
        self.gender = gender
    }
    
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
}


var kullanici = User(ad: "suleyman", lastName: "calik")
kullanici.fullName()
kullanici.firstName
kullanici.lastName


class Student: User {
    
    var number:Int
    
    init(firstName:String , lastName:String , number:Int) {
        self.number = number
        super.init(ad: firstName, lastName: lastName)
    }
    
}

var ogrenci = Student(firstName: "Test", lastName: "Mest", number: 1)
ogrenci.fullName()
ogrenci.gender = "Erkek"





















