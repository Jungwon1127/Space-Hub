//
//  SpaceNewsView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 12/16/21.
//

import SwiftUI

struct SpaceNewsView: View {
    @StateObject var vm = SpaceNewsViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.theme.background1, Color.theme.background2], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView {
                ForEach(vm.SpaceNews) { article in
                    SpaceNewsRow(spaceNews: article)
                    Divider()
                }
            }
        }
    }
}

struct SpaceNewsView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceNewsView()
    }
}
