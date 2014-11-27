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
    @IBOutlet weak var slider: UISlider!
    var locationManager = CLLocationManager()
    var distance = 1000.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        mapView.delegate = self
        slider.enabled = false
        slider.minimumValue = 100
        slider.maximumValue = 10000
        slider.value = slider.maximumValue - Float(distance)
    }
    
    
    // MARK: Utility Methods

    func updateMap(animated:Bool) {
        var region = MKCoordinateRegionMakeWithDistance(mapView.userLocation.coordinate, distance, distance)
        mapView.setRegion(region, animated: animated)
    }
    
    
    // MARK: - Mapview Methods
    
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        
        if let location:CLLocation = userLocation.location {
            slider.enabled = true
            updateMap(true)
        }
        else {
            slider.enabled = false
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

    
    // MARK: - Action Methods
    
    @IBAction func segmentChanged(sender: UISegmentedControl) {
        
        mapView.mapType = MKMapType(rawValue: UInt(sender.selectedSegmentIndex))!
        
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        
        var zoomValue = slider.maximumValue - slider.value
        println(zoomValue)
        distance = Double(zoomValue)
        updateMap(false)
    }

}






