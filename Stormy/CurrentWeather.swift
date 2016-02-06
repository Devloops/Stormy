//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Amr Sami on 2/6/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class CurrentWeather {
    private var _currentWeatherUrl: String!
    var currentDay: CurrentDay!
    
    init() {
        _currentWeatherUrl = "\(URL_BASE_CURRENT)\(user.userLocation)&\(API_KEY)&units=metric"
    }
    
    func downloadCurrentWeather(compeleted: downloadCompleted) {
        let url = NSURL(string: _currentWeatherUrl)!
        
        Alamofire.request(.GET, url).responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            if let jsonDict = response.result.value as? Dictionary<String, AnyObject> {
                if let weatherInfoArr = jsonDict["weather"] as? [Dictionary<String, AnyObject>], let mainTempDict = jsonDict["main"] as? Dictionary<String, Int> {
                    if let weatherDescription = weatherInfoArr[0]["main"] as? String,let icon = weatherInfoArr[0]["icon"] as? String ,let temp = mainTempDict["temp"] {
                        self.currentDay = CurrentDay(temp: temp, icon: UIImage(named: icon)!, description: weatherDescription)
                    }
                }
            }
            compeleted()
        }
    }
}