//
//  ViewController.swift
//  Stormy
//
//  Created by Amr Sami on 2/6/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import UIKit
import CoreLocation

var user: UserDetails!

class WeatherVC: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var degreeLbl: UILabel!
    @IBOutlet weak var dayZeroTimeLbl: UILabel!
    @IBOutlet weak var dayZeroIconImg: UIImageView!
    @IBOutlet weak var dayZeroWeatherLbl: UILabel!
    @IBOutlet weak var dayOneTimeLbl: UILabel!
    @IBOutlet weak var dayOneIconImg: UIImageView!
    @IBOutlet weak var dayOneWeatherLbl: UILabel!
    @IBOutlet weak var dayTwoTimeLbl: UILabel!
    @IBOutlet weak var dayTwoIconImg: UIImageView!
    @IBOutlet weak var dayTwoWeatherLbl: UILabel!
    @IBOutlet weak var dayThreeTimeLbl: UILabel!
    @IBOutlet weak var dayThreeIconImg: UIImageView!
    @IBOutlet weak var dayThreeWeatherLbl: UILabel!
    @IBOutlet weak var dayFourTimeLbl: UILabel!
    @IBOutlet weak var dayFourIconImg: UIImageView!
    @IBOutlet weak var dayFourWeatherLbl: UILabel!
    @IBOutlet weak var dayFiveTimeLbl: UILabel!
    @IBOutlet weak var dayFiveIconImg: UIImageView!
    @IBOutlet weak var dayFiveWeatherLbl: UILabel!
    @IBOutlet weak var daySixTimeLbl: UILabel!
    @IBOutlet weak var daySixIconImg: UIImageView!
    @IBOutlet weak var daySixWeatherLbl: UILabel!
    
    
    
    var weakWeather: WeaklyWeather!
    var currentWeather: CurrentWeather!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func viewWillAppear(animated: Bool) {
        locationAuthStatus()
    }
    
    func updateCurrentDay() {
        currentWeather.downloadCurrentWeather { () -> () in
            //this will be called after download is done
            self.UpdateCurrentWeatherUI()
        }
    }
    
    func updateWeak() {
        weakWeather.downloadWeakWeatherDetails { () -> () in
            //this will be called after download is done
            self.updateWeakUI()
        }
    }
    
    func UpdateCurrentWeatherUI() {
        mainImg.image = currentWeather.currentDay.icon
        descriptionLbl.text = currentWeather.currentDay.description
        degreeLbl.text = currentWeather.currentDay.temp
    }
    
    func updateWeakUI() {
        //Day Zero
        dayZeroTimeLbl.text = weakWeather.days[0].time
        dayZeroIconImg.image = weakWeather.days[0].icon
        dayZeroWeatherLbl.text = weakWeather.days[0].weather
        
        //Day One
        dayOneTimeLbl.text = weakWeather.days[1].time
        dayOneIconImg.image = weakWeather.days[1].icon
        dayOneWeatherLbl.text = weakWeather.days[1].weather
        
        //Day Two
        dayTwoTimeLbl.text = weakWeather.days[2].time
        dayTwoIconImg.image = weakWeather.days[2].icon
        dayTwoWeatherLbl.text = weakWeather.days[2].weather
        
        //Day Three
        dayThreeTimeLbl.text = weakWeather.days[3].time
        dayThreeIconImg.image = weakWeather.days[3].icon
        dayThreeWeatherLbl.text = weakWeather.days[3].weather
        
        //Day Four
        dayFourTimeLbl.text = weakWeather.days[4].time
        dayFourIconImg.image = weakWeather.days[4].icon
        dayFourWeatherLbl.text = weakWeather.days[4].weather
        
        //Day Five
        dayFiveTimeLbl.text = weakWeather.days[5].time
        dayFiveIconImg.image = weakWeather.days[5].icon
        dayFiveWeatherLbl.text = weakWeather.days[5].weather
        
        //Day Six
        daySixTimeLbl.text = weakWeather.days[6].time
        daySixIconImg.image = weakWeather.days[6].icon
        daySixWeatherLbl.text = weakWeather.days[6].weather
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last where locationManager.location != nil {
            user = UserDetails(location: location)
        }
        locationManager.stopUpdatingLocation()
        weakWeather = WeaklyWeather()
        currentWeather = CurrentWeather()
        updateCurrentDay()
        updateWeak()
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }


}

