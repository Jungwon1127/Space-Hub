//
//  ApodViewModel.swift
//  Space Hub
//
//  Created by Jungwon Kim on 11/5/21.
//

import Foundation
import Combine

class ApodViewModel: ObservableObject {
    @Published var apodData: ApodModel = ApodModel(date: "?/?/?", explanation: "No Explaination", url: "No URL", thumbnailUrl: nil, title: "No title")
    @Published var date = Date()
    
    private let dataService = ApodDataService()
    private var cancellables = Set<AnyCancellable>()
    
    let dateRange: ClosedRange<Date> = {
        let start = Calendar.current.date(from: DateComponents(year: 1995, month: 6, day: 16))!
        let end = Date()
    
        return start...end
    }()

    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$apodData
            .sink { [weak self] returnedData in
                self?.apodData = returnedData
            }
            .store(in: &cancellables)
    }
    
    func callData() {
        dataService.makeURL(date: date)
        dataService.getApodData()
    }
}
