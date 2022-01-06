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
        ZStack {
            // Background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // Content Layer
            VStack(alignment: .center) {
                Text("On \(Date(), style: .date), it is...")
                    .font(.headline)
                
                HStack {

                    VStack(alignment: .center) {
                        FullMoonView()
                            .frame(width: 80)

                        Text(vm.getMoonPhase())
                            .minimumScaleFactor(0.5)
                            .frame(width: 80, height: 20)
                            .multilineTextAlignment(.center)
                            .font(.headline)
                    }
                    .frame(height: 100)

                    Spacer()


                    VStack {
                        Text("\(vm.getTemperature(farenheight: farenheight))")
                            .font(.system(size: 40))


                        Text(vm.currentConditions.conditions)
                            .font(.headline)
                    }
                    .frame(height: 100)
                }
                .frame(width: 250, height: 100)
                .padding()
                
                ZStack {
                    Color.gray
                    
                    HStack {
                        Spacer()
                        
                        Text("Sunrise:")
                            .font(.headline)
                        IconTimeView(icon: "sunrise.fill", time: vm.formatTime(time: vm.currentConditions.sunrise))
                        
                        Spacer()
                        
                        Text("Sunset:")
                        IconTimeView(icon: "sunset.fill", time: vm.formatTime(time: vm.currentConditions.sunset))
                        
                        Spacer()

                    }
                }
                .frame(height: 80)
                .cornerRadius(10)
                
                
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            
            
            
//            VStack{
//                List {
//
//                    NavigationLink("APOD") {
//                        ApodView()
//                            .navigationBarTitleDisplayMode(.inline)
//                    }
//
//                    NavigationLink("ISS Location") {
//                        ISSLocationView()
//                            .navigationBarTitleDisplayMode(.inline)
//                    }
//
//                    NavigationLink("NEWS") {
//                        SpaceNewsView()
//                            .navigationBarTitleDisplayMode(.inline)
//                    }
//                }
//                .listStyle(.grouped)
//            }
            
        }
        .onAppear {
            vm.fetchData()
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
