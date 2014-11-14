//
//  SearchController.swift
//  SwiftGraffiti
//
//  Created by Ian Norris on 11/13/14.
//  Copyright (c) 2014 Ializa. All rights reserved.
//



import UIKit
import MapKit
import CoreLocation

class SearchController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var searchField: UITextField!

   
    @IBAction func didEndOnExit(sender: AnyObject) {
    }
    @IBOutlet weak var button: UITextField!
    @IBAction func searchButtonPressed(sender: AnyObject) {
        println("TEST");
    }
   
}

