//
//  IconTimeView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/5/22.
//

import SwiftUI

struct SunTimeView: View {
    let icon: String
    let time: String
    let string: String
    
    var body: some View {
        VStack(alignment: .center) {
            
            Text(time)
                .font(.headline)
            Image(systemName: icon)
                .font(.headline)
                .foregroundColor(.yellow)
            Text(string)
                .font(.headline)
        }
    }
}

struct IconTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SunTimeView(icon: "sunrise", time: "4:43AM", string: "Sunrise")
    }
}
