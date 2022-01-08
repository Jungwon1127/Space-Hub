//
//  SwiftUIView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/6/22.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Image(systemName: "moon.stars.fill")
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.primary, Color.yellow)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
