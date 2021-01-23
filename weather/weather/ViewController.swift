//
//  ViewController.swift
//  weather
//
//  Created by Robins Frieda on 1/23/21.
//  Copyright © 2021 Sabina Z. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startLocationManager()
    }
    
    func startLocationManager(){
//        зпрос при первом запуске
        locationManager.requestWhenInUseAuthorization()
        
//включена ли локация у пользователя
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingHeading()
        }
    }

}
// подписали класс протоколом
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations :
    [CLLocation]) {
//         получаем местоположение
        if let lastLocation = locations.last{
            print(lastLocation.coordinate.latitude,lastLocation.coordinate.longitude)
        }
    }
}
