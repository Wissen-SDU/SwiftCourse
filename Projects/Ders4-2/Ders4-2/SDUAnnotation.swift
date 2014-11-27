//
//  SDUAnnotation.swift
//  Ders4-2
//
//  Created by Suleyman Calik on 27.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import Foundation
import MapKit

class SDUAnnotation: NSObject, MKAnnotation {

    var coordinate:CLLocationCoordinate2D
    var title: String!
    var subtitle: String!
    
    init(coordinate:CLLocationCoordinate2D) {
        self.coordinate = coordinate
        title = ""
        subtitle = ""
    }

}