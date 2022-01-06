//
//  TemperatureView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/6/22.
//

import SwiftUI

struct TemperatureView: View {
    let temperature: String
    let condition: String
    
    var body: some View {
        VStack {
            Text(temperature)
                .font(.system(size: 40))
            
            
            Text(condition)
                .font(.headline)
        }
        .frame(height: 100)
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(temperature: "43", condition: "Clear")
    }
}
