//
//  WeatherModel.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/3/22.
//

import Foundation
import SwiftUI

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
    let moonphase: Double
    let sunrise: String
    let sunset: String
    let visibility: Double
    let cloudCover: Double
    
    enum CodingKeys: String, CodingKey {
        case dateTime = "datetime"
        case temp
        case humidity
        case precip
        case conditions
        case icon
        case moonphase
        case sunrise
        case sunset
        case visibility
        case cloudCover = "cloudcover"
    }
}
