//
//  ApodView.swift
//  Space Hub
//
//  Created by Jungwon Kim on 11/4/21.
//

import SwiftUI

struct ApodView: View {
    @StateObject var vm = ApodViewModel()
    
    var body: some View {
        ZStack {
            // Background Layer
            LinearGradient(colors: [Color.theme.background1, Color.theme.background2], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            // Content Layer
            VStack() {
                Text(vm.apodData.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .underline()
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.theme.accent)
                    .minimumScaleFactor(0.01)
                    .frame(height: 30)
                
                AsyncImage(url: URL(string: vm.apodData.thumbnailUrl ?? vm.apodData.url)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .background(Color.black)
                    .cornerRadius(10)
                
                
                HStack {
                    DatePicker(selection: $vm.date,
                               in: vm.dateRange,
                               displayedComponents: [.date]) {
                        Text("Date")
                            .fontWeight(.bold)
                            .font(.headline)
                    }
                               .datePickerStyle(.compact)
                               .tint(Color.theme.accent)
                    
                    Spacer()
                    
                    Button {
                        vm.callData()
                    } label: {
                        Text("Search")
                            .frame(minHeight: 35)
                            .padding(.horizontal)
                            .background(Color.theme.backgroundTextColor)
                            .foregroundColor(Color.theme.accent)
                            .cornerRadius(3)
                    }
                }
                                
                ZStack() {
                    Color.theme.backgroundTextColor
                    
                    ScrollView(showsIndicators: false) {
                            
                        Text(vm.apodData.explanation)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.theme.accent)
                            .multilineTextAlignment(.center)
                        
                        HStack {
                            Text("Source URL: ")
                            
                            Text(vm.apodData.url)
                        }
                        .foregroundColor(Color.theme.accent)
                        .font(.subheadline)
                        .padding(.top)
                    }
                    .padding()

                }
                .cornerRadius(10)
            }
            .padding([.leading, .trailing, .bottom])
        }
    }
}

struct ApodView_Previews: PreviewProvider {
    static var previews: some View {
        ApodView()
    }
}
