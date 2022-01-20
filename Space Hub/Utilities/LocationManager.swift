//
//  LocationManager.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/7/22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    var cityState = ""
    
    func checkIfLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Show an alert showing them that location services is turned off")
        }
    }
    
    private func checkLocationAuthorization() {
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
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func getLongLat() -> String {
        return String(locationManager?.location?.coordinate.latitude ?? 0.0) + "," + String(locationManager?.location?.coordinate.longitude ?? 0.0)
    }
    
    func getLocation() {
        guard let location = locationManager?.location else { return }
                
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let self = self else { return }

            if let _ = error {
                return
            }
                        
            guard let placemark = placemarks?.first else {
                return
            }
            
            DispatchQueue.main.async {
                self.cityState = "\(placemark.locality ?? "No City"), \(placemark.administrativeArea ?? "No State")"
            }
        }
    }
}
