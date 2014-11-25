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
protocol SearchControllerDelegate{
    func mySearchDidFinish(controller:SearchController,text:String)
}
class SearchController: UIViewController, CLLocationManagerDelegate {
    var delegate:SearchControllerDelegate? = nil
    @IBOutlet weak var searchField: UITextField!

   
    @IBAction func didEndOnExit(sender: AnyObject) {
    }
    @IBOutlet weak var button: UITextField!
    @IBAction func searchButtonPressed(sender: AnyObject) {
        println("TEST");
        if(delegate != nil) {
            delegate!.mySearchDidFinish(self, text: searchField.text)
        }
        
    }
    
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "searchPullIn"{
        let vc = segue.destinationViewController as ViewController
        vc.mySearchText = searchField.text
    }
  }
   
}

