//
//  HomeView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 11/4/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // Background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // Content Layer
            VStack{
                List {
                    
                    NavigationLink("APOD") {
                        ApodView()
                            .navigationBarTitleDisplayMode(.inline)
                    }
                    
                    NavigationLink("ISS Location") {
                        ISSLocationView()
                            .navigationBarTitleDisplayMode(.inline)
                    }
                    
                    NavigationLink("NEWS") {
                        SpaceNewsView()
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
                .listStyle(.grouped)
                
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
                .navigationBarHidden(true)
        }
    }
}