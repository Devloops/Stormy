//
//  WeaklyWeather.swift
//  Stormy
//
//  Created by Amr Sami on 2/6/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class WeaklyWeather {
   
    var days = [Day]()
    
    private var _weaklyWeatherUrl: String!
    
    init() {
        _weaklyWeatherUrl = "\(URL_BASE_WEAKLY)\(DAYS_NUMBER)&\(user.userLocation)&\(API_KEY)&units=metric"
    }
    
    func downloadWeakWeatherDetails(completed: downloadCompleted) {
        if let url = NSURL(string: self._weaklyWeatherUrl) {
            Alamofire.request(.GET, url).responseJSON { (response: Response<AnyObject, NSError>) -> Void in
                if let jsonDict = response.result.value as? Dictionary<String, AnyObject> {
                    
                    if let weatherArray = jsonDict["list"] as? [Dictionary<String, AnyObject>] {
                        for var i = 0; i < weatherArray.count; i++ {
                            if let dt = weatherArray[i]["dt"] as? Int, let tempDict = weatherArray[i]["temp"] as? Dictionary<String, Int>, let weatherInfoArray = weatherArray[i]["weather"] as? [Dictionary<String, AnyObject>] {
                                if let min = tempDict["min"], let max = tempDict["max"], let icon = weatherInfoArray[0]["icon"] as? String {
                                    let day = Day(max: max, min: min, time: self.weeekDateStringFromUnixtime(dt), icon: UIImage(named: icon)!)
                                    self.days.append(day)
                                }
                                
                            }
                            
                        }
                    }
                }
                    completed()
            }

        } else {
            print("bad url")
        }
        
    }
    
    
    
    func weeekDateStringFromUnixtime(unixTime: Int) -> String {
        
        let timeInSeconds = NSTimeInterval(unixTime)
        let weatherDate = NSDate(timeIntervalSince1970: timeInSeconds)
        
        let dateFormatter = NSDateFormatter()
        //dateFormatter.timeStyle = .MediumStyle
        dateFormatter.dateFormat = "EEE"
        
        return dateFormatter.stringFromDate(weatherDate)
    }

}