//
//  CurrentDay.swift
//  Stormy
//
//  Created by Amr Sami on 2/6/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import Foundation
import UIKit

class CurrentDay {
    private var _currentDayTemp: Int!
    private var _currentDayDescription: String!
    private var _currentDayIcon: UIImage!
    
    init (temp: Int, icon: UIImage, description: String) {
        _currentDayTemp = temp
        _currentDayIcon = icon
        _currentDayDescription = description
    }
    
    var temp: String {
        return "\(_currentDayTemp)°"
    }
    
    var description: String {
        return _currentDayDescription
    }
    
    var icon: UIImage {
        return _currentDayIcon
    }
    
}