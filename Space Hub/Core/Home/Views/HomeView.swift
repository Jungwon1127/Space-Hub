//
//  HomeView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 11/4/21.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab = "Home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            WeatherView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag("Home")
            
            SpaceView()
                .tabItem {
                    Label {
                        Text("Space")
                    } icon: {
                        Image(systemName: "moon.stars.fill")
                            .renderingMode(.template)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.white, Color.yellow)
                    }

                }
                .tag("Space")
            
            SpaceNewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
                .tag("News")
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

