//
//  WeatherView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/7/22.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var vm = WeatherViewModel()
    @State var farenheight = true
    
    var body: some View {
        ZStack {
            // Background layer
            LinearGradient(colors: [Color.theme.background1, Color.theme.background2], startPoint: .topLeading, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            // Content Layer
            VStack(alignment: .center) {
                Text("On \(Date(), style: .date), it is...")
                    .font(.headline)
                
                LocationView(address: vm.weather.resolvedAddress)
                
                HStack {
                    
                    MoonView(moonPhase: vm.getMoonPhase())
                    
                    Spacer()
                    
                    TemperatureView(temperature: vm.getTemperature(farenheight: farenheight), condition: vm.weather.currentConditions.conditions)
                    
                }
                .frame(width: 250, height: 100)
                .padding()
                
                Text("\(vm.weather.currentConditions.conditions) skys tonight with clouds covering \(vm.weather.currentConditions.cloudCover.removeZerosFromEnd())% of the sky, \(vm.stargazingString())")
                    .fontWeight(.medium)
                    .padding()
                    .multilineTextAlignment(.center)
                
                SunTimeBar(sunrise: vm.formatTime(time: vm.weather.currentConditions.sunrise), sunset: vm.formatTime(time: vm.weather.currentConditions.sunset))
                
                
                
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            
        }
        .onAppear {
            vm.fetchData()
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
