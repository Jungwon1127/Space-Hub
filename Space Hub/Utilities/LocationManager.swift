//
//  LocationManager.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/7/22.
//

import Foundation
import CoreLocation

class LocationManager {
    var locationManager: CLLocationManager?
    
    func checkIfLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
        } else {
            print("Show an alert showing them that location services is turned off")
        }
    }
    
    func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("Location Restricted")
            case .denied:
                print("Denied app location permission, change in settings")
            case .authorizedAlways, .authorizedWhenInUse:
                break
            @unknown default:
                break
        }
    }
}
