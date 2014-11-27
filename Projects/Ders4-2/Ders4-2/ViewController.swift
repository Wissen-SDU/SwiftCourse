//
//  ViewController.swift
//  Ders4-2
//
//  Created by Suleyman Calik on 27.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapview: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        okuluGoster()
    }
    
    
    func okuluGoster() {
        
        var ann = SDUAnnotation(coordinate: CLLocationCoordinate2D(latitude: 37.829, longitude: 30.526))
        ann.title = "Suleyman Demirel Uni"
        ann.subtitle = "Isparta"
        mapview.addAnnotation(ann)
        
        
        var region = MKCoordinateRegionMakeWithDistance(ann.coordinate, 5000, 5000)
        mapview.setRegion(region, animated: true)
    }

    
    // MARK: - Mapview Methods
    
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        let identifier = "AnnotationID"
        
        var annView = mapview.dequeueReusableAnnotationViewWithIdentifier(identifier)
        
        if annView == nil {
            annView = MKAnnotationView(annotation:annotation, reuseIdentifier:identifier)
        }
        
        annView.canShowCallout = true
        annView.image = UIImage(named: "logo")
        annView.rightCalloutAccessoryView = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as UIView

        return annView
    }
    
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        var coordinate = view.annotation.coordinate
        
    var url = NSURL(string: "http://maps.apple.com/maps?q=\(coordinate.latitude),\(coordinate.longitude)")
    UIApplication.sharedApplication().openURL(url!)

//        var url = NSURL(string: "sdu://?kjsfbvkjbvj")!
//        
//        if UIApplication.sharedApplication().canOpenURL(url) {
//            UIApplication.sharedApplication().openURL(url)
//        }
//        else {
//            
//        }
    }

}







