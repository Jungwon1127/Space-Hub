//
//  IconTimeView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/5/22.
//

import SwiftUI

struct IconTimeView: View {
    let icon: String
    let time: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: icon)
                .font(.headline)
                .foregroundColor(.yellow)
            Text(time)
                .font(.headline)
        }
    }
}

struct IconTimeView_Previews: PreviewProvider {
    static var previews: some View {
        IconTimeView(icon: "sunrise", time: "4:43")
    }
}
