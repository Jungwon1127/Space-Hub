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
                    Image(systemName: "moon")
                    Text("\(farenheight ? (vm.currentConditions.temp * 9/5 + 32) : vm.currentConditions.temp, specifier: "%.1f")")
                }
                
                Button(action: {
                    farenheight.toggle()
                }) {
                    Text("Hello!")
                }
                
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
        NavigationView{
            HomeView()
                .navigationBarHidden(true)
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
        }
    }
}
