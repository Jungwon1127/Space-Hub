//
//  SpaceNewsRow.swift
//  Space Hub
//
//  Created by Jungwon Kim on 12/16/21.
//

import SwiftUI

struct SpaceNewsRow: View {
    var spaceNews: SpaceNewsModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: spaceNews.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            
            VStack(alignment: .leading) {
                Text(spaceNews.title)
                Text(spaceNews.newsSite)
            }
            .minimumScaleFactor(0.01)
            .font(.body.weight(.bold))
            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
            .padding(.horizontal)
            .background(Color.theme.backgroundTextColor.opacity(0.8))
        }
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.primary)
        )
        .onTapGesture {
            UIApplication.shared.open(URL(string: spaceNews.url)!)
        }
    }
}

struct SpaceNewsRow_Previews: PreviewProvider {
    static var previews: some View {
        SpaceNewsRow(spaceNews: SpaceNewsModel(id: 1, title: "no title", url: "", imageUrl: "", newsSite: "", summary: ""))
    }
}
