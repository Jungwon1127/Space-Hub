//
//  SpaceView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/6/22.
//

import SwiftUI

struct SpaceView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("APOD") {
                    ApodView()
                }
                .navigationBarHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                
                NavigationLink("ISS") {
                    ISSLocationView()
                }
                .navigationBarHidden(true)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct SpaceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SpaceView()
                .navigationBarHidden(true)
        }
        
    }
}
