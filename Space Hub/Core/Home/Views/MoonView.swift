//
//  MoonView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/6/22.
//

import SwiftUI


struct MoonView: View {
    let moonPhase: String
    
    var body: some View {
        VStack(alignment: .center) {
            FullMoonView()
                .frame(width: 80)
            
            Text(moonPhase)
                .minimumScaleFactor(0.5)
                .frame(width: 80, height: 20)
                .multilineTextAlignment(.center)
                .font(.headline)
        }
        .frame(height: 100)
    }
}

struct MoonView_Previews: PreviewProvider {
    static var previews: some View {
        MoonView(moonPhase: "Waning Gibbous")
    }
}
