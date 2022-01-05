//
//  WeatherModel.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/3/22.
//

import Foundation

struct WeatherModel: Codable {
    let currentConditions: CurrentConditions
}

struct CurrentConditions: Codable {
    let dateTime: String
    let temp: Double
    let humidity: Double
    let precip: Double
    let conditions: String
    let icon: String
    let moonphase: Int
    let sunrise: String
    let sunset: String
}
