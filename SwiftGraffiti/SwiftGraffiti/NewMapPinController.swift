//
//  NewMapPinController.swift
//  SwiftGraffiti
//
//  Created by Ian Norris on 11/26/14.
//  Copyright (c) 2014 Ializa. All rights reserved.
//


import UIKit
import MapKit
import CoreLocation
protocol NewMapPinControllerDelegate {
    func myAddingOfPinDidFinish(controller:NewMapPinController, tagLocation:CLLocation)
}
class NewMapPinController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var delegate:NewMapPinControllerDelegate? = nil;
    var tagLocation:CLLocation? = nil;
    var ui:UILongPressGestureRecognizer?;
    
    var locManager: CLLocationManager!

    override func viewDidLoad() {
        
    }
    
    @IBAction func afterPress(sender: AnyObject) {
        println("Does this work?")
        
    }
    @IBOutlet var longPressGesture: UILongPressGestureRecognizer!
    @IBAction func addLocationToTag(sender: AnyObject) {
        if(delegate != nil) {
            if(tagLocation != nil) {
                delegate?.myAddingOfPinDidFinish(self, tagLocation: tagLocation!)
            }
        }
    }
    func doMapSetUp(){
        locManager = CLLocationManager()
        locManager.delegate = self
        locManager!.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    @IBOutlet weak var addLocationButton: UIButton!
}
