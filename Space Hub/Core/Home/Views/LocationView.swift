//
//  LocationView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/7/22.
//

import SwiftUI

struct LocationView: View {
    let address: String
    
    var body: some View {
        HStack {
            Image(systemName: "location")
            
            Text(address)
                .font(.footnote)
                .padding(8)
                .background(Capsule().stroke(lineWidth: 1))
            
            
            
        }
        .padding()
    }
}


struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(address: "Los Angeles")
    }
}
