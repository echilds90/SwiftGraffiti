//
//  NewTagController.swift
//  SwiftGraffiti
//
//  Created by Ian Norris on 11/25/14.
//  Copyright (c) 2014 Ializa. All rights reserved.
//

import Foundation
import UIKit
import MapKit
protocol NewTagControllerDelegate{
    func myAddingOfTagDidFinish(controller:NewTagController,image:UIImageView)
}
class NewTagController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate, NewTagControllerDelegate,
NewMapPinControllerDelegate{
    var delegate:NewTagControllerDelegate? = nil;
    @IBAction func addTag(sender: AnyObject) {
        if(delegate != nil) {
            delegate!.myAddingOfTagDidFinish(self, image: imageView)
        }
    }
     func myAddingOfTagDidFinish(controller: NewTagController, image: UIImageView) {
        
    }
    func myAddingOfPinDidFinish(controller:NewMapPinController, tagLocation:CLLocation) {
        println("Got here?");
    }

    @IBAction func buttonTapped(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            println("Button capture")
            var imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            //imag.mediaTypes = [kUTTypeImage];
            imag.allowsEditing = false
            self.presentViewController(imag, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        let selectedImage : UIImage = image
        //var tempImage:UIImage = editingInfo[UIImagePickerControllerOriginalImage] as UIImage
        imageView.image=selectedImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    var searchDelegate:SearchControllerDelegate? = nil
    
    @IBOutlet weak var tag: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var uploadPhoto: UIButton!
    @IBOutlet weak var imageView: UIImageView!=nil
    
        
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PlacePinOnNewTag"{
            let vc = segue.destinationViewController as NewMapPinController
            vc.delegate = self;
        }
    }
    
}
