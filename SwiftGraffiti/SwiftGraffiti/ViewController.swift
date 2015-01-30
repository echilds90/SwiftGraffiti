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

class ViewController: UIViewController, CLLocationManagerDelegate, SearchControllerDelegate, NewTagControllerDelegate {
    
    var locManager: CLLocationManager!
    var currentLocation: CLLocation!
    var newTags: [Tag]!
    //var tagRepository: TagRepository!
    
    let location = CLLocationCoordinate2D(
        latitude: 37.7833,
        longitude: -122.4167
    )
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "searchPullOut"{
            print("WASSUP");
        }
        if(segue.identifier == "sentToAddPin") {
            let vc = segue.destinationViewController as NewTagController
            vc.delegate = self;
        }
    }
    
    func myAddingOfTagDidFinish(controller:NewTagController,image:UIImageView) {
        controller.navigationController?.popViewControllerAnimated(true);
    }
    func mySearchDidFinish(controller: SearchController, text: String) {
        searchStuff.text = text
        controller.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBOutlet weak var searchStuff: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    func locationManager(_manager: CLLocationManager!,
        didUpdateLocations locations: [AnyObject]!) {
            currentLocation = locManager.location
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchStuff.text = mySearchText
        loadSavedTags(mySearchText)
        doMapSetUp()
        loadMapViewBasedOnLocation()
        
    }
    var mySearchText = "";
    
    func doMapSetUp(){
        locManager = CLLocationManager()
        locManager.delegate = self
        locManager!.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    func loadSavedTags(searchText: String){
        //TODO: lack of Dependecy Injection makes EliIan cry
        if(searchText != "")
        {
            newTags = TagRepository().searchTags(searchText);
        }
        else {
            newTags = TagRepository().loadTags();
        }
        addPinsToMap(newTags)
    }

    func loadMapViewBasedOnLocation(){
        
        let span = MKCoordinateSpanMake(0.1, 0.1)
        
        if  let localLocation = locManager.location {
            
            let region = MKCoordinateRegion(center: localLocation.coordinate, span: span)
            
            mapView.setRegion(region, animated: true)
            
        } else {
            println("The location is sad :(")
        }
    }
    
    @IBOutlet weak var tagName: UITextField!

    //TODO: Rename this Eliza is confused
    @IBAction func forceShitToPleaseWork(sender: AnyObject) {
        
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
    
    func addPinsToMap(pins: Array<Tag>)
    {
        for pin in pins {
            addPinToMap(pin.location.coordinate, title: pin.description, subtitle: "Heck Yes")
        }
    }
    
    func addPinToMap(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(coordinate)
        annotation.title = title
        annotation.subtitle = "Heck Yes"
        mapView.addAnnotation(annotation)
    }


    @IBAction func addPin(sender: AnyObject) {
        
        if let localLocation = currentLocation
        {
            addPinToMap(currentLocation.coordinate, title: tagName.text, subtitle: "Heck Yes")
            newTags.append(Tag(description: tagName.text, location: localLocation))
            tagName.text = ""
            TagRepository().saveTags(newTags)
        }
        else {
            println("Sad face :(");
        }
        
        
    }

    

}

