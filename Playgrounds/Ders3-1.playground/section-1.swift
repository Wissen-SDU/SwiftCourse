// Playground - noun: a place where people can play

import UIKit

enum PusulaYonu {
    case Kuzey
    case Guney
    case Dogu
    case Bati
}

var istikamet = PusulaYonu.Kuzey

switch istikamet {
case PusulaYonu.Kuzey:
    "Kuzey"
case .Guney:
    "Guney"
default:
    "Diger"
}



enum Gezegen:Int {
    case Merkur = 1
    case Venus
    case Dunya,Mars,Jupiter
}

Gezegen.Merkur.rawValue
Gezegen.Venus.rawValue
Gezegen.Dunya.rawValue
Gezegen.Mars.rawValue
Gezegen.Jupiter.rawValue


enum ServerKodu :Int {
    case Basarili = 200
    case KayitOlustu
    case GenelHata = 300
    case Moved
    case Ulasilamiyor = 400
}



///

enum UserType {
    case Student(String)
    case Teacher(String)
}


func printUser(type:UserType) {
    switch type {
    case UserType.Student(let name):
        "Bu bir ogrenci: \(name)"
    case UserType.Teacher(let name):
        "Bu bir ogretmen: \(name)"
    }
}


printUser(UserType.Student("Suleyman"))

printUser(.Teacher("Ahmet"))






