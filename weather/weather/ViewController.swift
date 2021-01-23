//
//  ViewController.swift
//  weather
//
//  Created by Robins Frieda on 1/23/21.
//  Copyright © 2021 Sabina Z. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startLocationManager()
    }
    
//    получение информации о погоде по широте и долготе
    func updateWeatherInfo(latitude: Double, longtitude: Double){
        let session = URLSession.shared
        
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longtitude.description)&appid=fa7f0a03b2f57a44c99e644a7dca1dc9&lang=ru&units=metric")!
        
        let task = session.dataTask(with: url){(data,response,error) in
            guard error == nil else {
                print("DataTask error \(error?.localizedDescription)")
                return
            }
            do {
                self.weatherData = try JSON().decode(WeatherData.self,from: data!)
                print(self.weatherData)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
                
    }
    
    func startLocationManager(){
//        зпрос при первом запуске
        locationManager.requestWhenInUseAuthorization()
        
//включена ли локация у пользователя
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingLocation()        }
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
