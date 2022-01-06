//
//  SunTimeBar.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/6/22.
//

import SwiftUI


struct SunTimeBar: View {
    let sunrise: String
    let sunset: String
    
    var body: some View {
        ZStack {
            Color.theme.backgroundTextColor
            
            HStack {
                Spacer()
                
                SunTimeView(icon: "sunrise.fill", time: "\(sunrise)", string: "Sunrise")
                
                Spacer()
                
                SunTimeView(icon: "sunset.fill", time: "\(sunset)", string: "Sunset")
                
                Spacer()
                
            }
        }
        .frame(height: 80)
        .cornerRadius(10)
    }
}

struct SunTimeBar_Previews: PreviewProvider {
    static var previews: some View {
        SunTimeBar(sunrise: "6:34", sunset: "4:34")
    }
}
