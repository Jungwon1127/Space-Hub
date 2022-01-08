//
//  ISSLocationView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 11/22/21.
//

import SwiftUI
import MapKit

struct ISSLocationView: View {
    @StateObject var vm = ISSLocationViewModel()
    
    let timer = Timer.publish(every: 30.0, on: .main, in: .common).autoconnect()

    var body: some View {
        let ISS = [
            ISSPlace(name: "ISS", coordinate: CLLocationCoordinate2D(latitude: vm.ISSLocation.latitude, longitude: vm.ISSLocation.longitude))
        ]
        
        ZStack {
            
            LinearGradient(colors: [Color.theme.background1, Color.theme.background2], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Map(coordinateRegion: $vm.region, showsUserLocation: true, annotationItems: ISS) {
                    MapAnnotation(coordinate: $0.coordinate) {
                        Image("ISS")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                }
                .frame(height: 500)
                .onReceive(timer) { value in
                    vm.callData()
                    vm.updateTime(time: value)
                }
                
                ISSRow(title: Text("Last Updated: "), description: Text("\(vm.time) PM"))
                ISSRow(title: Text("Latitude:"), description: Text("\(vm.ISSLocation.latitude, specifier: "%.2f")"))
                ISSRow(title: Text("Longitude:"), description: Text("\(vm.ISSLocation.longitude, specifier: "%.2f")"))
                ISSRow(title: Text("Altitude: "), description: Text("\(vm.ISSLocation.altitude, specifier: "%.2f")"))
                ISSRow(title: Text("Velocity: "), description: Text("\(vm.ISSLocation.velocity, specifier: "%.2f") \(vm.ISSLocation.units)"))
                ISSRow(title: Text("Visibility: "), description: Text("\(vm.ISSLocation.visibility)"))
                
                Spacer()

            }
        }
    }
}

struct ISSLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ISSLocationView()
    }
}

struct ISSRow: View {
    let title: Text
    let description: Text
    
    var body: some View {
        HStack {
            title
            description
        }
    }
}

