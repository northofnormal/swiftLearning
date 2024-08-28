//
//  Forecast.swift
//  SwitfLearnings
//
//  Created by Anne Cahalan on 8/25/24.
//

import Foundation

struct Forecast: Codable {
    let lat: String
    let lon: String
    let current: Current
}

struct Current: Codable {
    let sunrise: String
    let sunset: String
    let temp: Double
    let feelsLike: Double
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [Weather]
}

struct Weather: Codable {
   // let id: Int
    let main: String
    let description: String
    let icon: String
}
