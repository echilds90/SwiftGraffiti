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
}