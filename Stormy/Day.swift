//
//  Day.swift
//  Stormy
//
//  Created by Amr Sami on 2/6/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import Foundation
import UIKit

class Day {
    private var _dayTemperatureMax: Int
    private var _dayTemperatureMin: Int
    private var _dayTime: String
    private var _dayIcon: UIImage
    
    init(max: Int, min: Int, time: String, icon: UIImage) {
        _dayTemperatureMax = max
        _dayTemperatureMin = min
        _dayTime = time
        _dayIcon = icon
    }
    
    var time: String {
        return _dayTime.uppercaseString
    }
    
    var max: Int {
        return _dayTemperatureMax
    }
    
    var min: Int {
        return _dayTemperatureMin
    }
    
    var icon: UIImage {
        return _dayIcon
    }
    
    var weather: String {
        return "\(min)°/\(max)°"
    }

    
}