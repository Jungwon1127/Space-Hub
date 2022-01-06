//
//  HomeView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 11/4/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    @State var farenheight = true
    
    var body: some View {
        TabView {
            ZStack {
                // Background layer
                Color.theme.background
                    .ignoresSafeArea()
                
                // Content Layer
                VStack(alignment: .center) {
                    Text("On \(Date(), style: .date), it is...")
                        .font(.headline)
                    
                    HStack {

                        MoonView(moonPhase: vm.getMoonPhase())

                        Spacer()

                        TemperatureView(temperature: vm.getTemperature(farenheight: farenheight), condition: vm.currentConditions.conditions)
                        
                    }
                    .frame(width: 250, height: 100)
                    .padding()
                    
                    Text("\(vm.currentConditions.conditions) skys tonight with clouds covering \(vm.currentConditions.cloudCover.removeZerosFromEnd())% of the sky, \(vm.stargazingString())")
                        .fontWeight(.medium)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    SunTimeBar(sunrise: vm.formatTime(time: vm.currentConditions.sunrise), sunset: vm.formatTime(time: vm.currentConditions.sunset))
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                
            }
            .onAppear {
                vm.fetchData()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            SpaceView()
                .tabItem {
                    Label("Space", systemImage: "moon.stars")
                }
            
            SpaceNewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView()
                .navigationBarHidden(true)
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            
        HomeView()
            .preferredColorScheme(.dark)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}
