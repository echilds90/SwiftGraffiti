//
//  Tag.swift
//  SwiftGraffiti
//
//  Created by ecchilds on 9/27/14.
//  Copyright (c) 2014 Ializa. All rights reserved.
//

import Foundation
import CoreLocation
class Tag
{
    var description: String
    var location: CLLocation
    
    init(description: String, location: CLLocation) {
        self.description = description
        self.location = location
    }
    
    init(info: NSDictionary) {
        self.description = info.objectForKey("description") as NSString
        var longitude = info.objectForKey("longitude") as Double
        var latitude = info.objectForKey("latitude") as Double
        self.location = CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func toDictionary() -> NSDictionary {
        var dictionary = [ "description": self.description, "latitude":self.location.coordinate.latitude, "longitude":self.location.coordinate.longitude]
        return dictionary as NSDictionary
    }
    
}