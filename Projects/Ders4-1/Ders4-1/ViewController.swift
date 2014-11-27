//
//  ViewController.swift
//  Ders4-1
//
//  Created by Suleyman Calik on 27.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        mapView.delegate = self

    }
    
    
    // MARK: - Mapview Methods
    
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        
        if let location:CLLocation = userLocation.location {
            
            var region = MKCoordinateRegionMakeWithDistance(location.coordinate, 1000, 1000)
            mapView.setRegion(region, animated: true)
            
        }
        
    }

    
    // MARK: - LocationManager Methods
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        println("didChangeAuthorizationStatus: \(status.rawValue)")
        
        switch status {
        case CLAuthorizationStatus.NotDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .Denied , .Restricted:
            println("Lokasyon IZNI YOK!!!")
        case .Authorized , .AuthorizedWhenInUse:
            mapView.showsUserLocation = true
        }
    }


}






