//
//  UserDetails.swift
//  Stormy
//
//  Created by Amr Sami on 2/6/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class UserDetails {
    private var _location: CLLocation!
        
    var lon: Double {
        if _location == nil {
            return 0.0
        } else {
         return _location.coordinate.longitude
        }

    }
    
    var lat: Double {
        if _location == nil {
            return 0.0
        } else {
            return _location.coordinate.latitude
        }
        
    }
    
    var userLocation: String {
        return "lat=\(lat)&lon=\(lon)"
    }
    
    init(location: CLLocation) {
        _location = location
    }
    
    init() {
        
    }
    
}