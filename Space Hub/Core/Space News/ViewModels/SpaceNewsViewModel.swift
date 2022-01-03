//
//  SpaceNewsViewModel.swift
//  Space Hub
//
//  Created by Jungwon Kim on 12/16/21.
//

import Foundation
import Combine

class SpaceNewsViewModel: ObservableObject {
    @Published var SpaceNews = [SpaceNewsModel(id: 0, title: "No Title", url: "No URL", imageUrl: "No URL", newsSite: "No URL", summary: "No Summary")]
    
    private let dataService = SpaceNewsDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$SpaceNews
            .sink { [weak self] returnedData in
                self?.SpaceNews = returnedData
            }
            .store(in: &cancellables)
    }
}
