//
//  ISSLocationModel.swift
//  Space Hub
//
//  Created by Jungwon Kim on 11/23/21.
//

import Foundation
import MapKit

struct ISSLocationModel: Codable {
    let latitude, longitude, altitude, velocity: Double
    let visibility: String
    let units: String
}

struct ISSPlace: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
