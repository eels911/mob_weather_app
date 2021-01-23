//
//  Data.swift
//  weather
//
//  Created by Robins Frieda on 1/23/21.
//  Copyright © 2021 Sabina Z. All rights reserved.
//

import Foundation

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Codable {
    var temp: Double = 0.0
    var humidity: Int = 0
    var pressure: Int = 0
}

struct WeatherData: Codable {
    var weather: [Weather] = []
    var main: Main = Main()
    var name: String = ""
}
