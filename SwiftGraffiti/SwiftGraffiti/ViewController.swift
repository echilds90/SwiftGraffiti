//
//  ViewController.swift
//  SwiftGraffiti
//
//  Created by ecchilds on 9/27/14.
//  Copyright (c) 2014 Ializa. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locManager: CLLocationManager!
    @IBOutlet weak var mapView: MKMapView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
//        let location = CLLocationCoordinate2D(
//            latitude: 37.7833,
//            longitude: -122.4167
//        )
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
       
        //3

        locManager = CLLocationManager()
        locManager!.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        if  let localLocation = locManager.location {
            
            let region = MKCoordinateRegion(center: localLocation.coordinate, span: span)
            
            mapView.setRegion(region, animated: true)
            
            
            let annotation = MKPointAnnotation()
            annotation.setCoordinate(localLocation.coordinate)
            annotation.title = "Big Ben"
            annotation.subtitle = "London"
            mapView.addAnnotation(annotation)
            
            
        } else {
            println("The location is sad :(")
        }
        

        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(_manager: CLLocationManager!,didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        }
    }


    

}

