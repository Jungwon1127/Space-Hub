//
//  ISSLocationViewModel.swift
//  Space Hub
//
//  Created by Jungwon Kim on 11/23/21.
//

import Foundation
import Combine
import MapKit

class ISSLocationViewModel: ObservableObject {
    @Published var ISSLocation = ISSLocationModel(latitude: 0, longitude: 0, altitude: 0, velocity: 0, visibility: "none", units: "none")
    @Published var time = ""
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 0,
            longitude: 0),
        span: MKCoordinateSpan(
            latitudeDelta: 50,
            longitudeDelta: 50))
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }
    
    private let dataService = ISSLocationDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
        updateTime(time: Date())
    }
    
    func addSubscribers() {
        dataService.$ISSLocation
            .sink { [weak self] returnedData in
                self?.ISSLocation = returnedData
                self?.region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: (self?.ISSLocation.latitude)!,
                        longitude: (self?.ISSLocation.longitude)!),
                    span: MKCoordinateSpan(
                        latitudeDelta: 100,
                        longitudeDelta: 180))
            }
            .store(in: &cancellables)
    }
    
    func callData() {
        dataService.getISSLocationData()
    }
    
    func updateTime(time: Publishers.Autoconnect<Timer.TimerPublisher>.Output) {
        self.time = dateFormatter.string(from: time)
    }
}
