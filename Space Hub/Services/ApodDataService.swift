//
//  ApodDataService.swift
//  Space Hub
//
//  Created by Jungwon Kim on 11/4/21.
//

import Foundation
import Combine


class ApodDataService {
    @Published var apodData = ApodModel(date: "?/?/?", explanation: "No Explaination", url: "No URL", thumbnailUrl: nil, title: "No Title")
    
    var obtainedData: AnyCancellable?
    
    var components = URLComponents()
            
    init() {
        makeURL()
        getApodData()
    }
    
    func getApodData() {
        print("getting data")
        guard let url = components.url else { return }
        print("URL valid")
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        obtainedData = NetworkingManager.download(url: url)
            .decode(type: ApodModel.self, decoder: decoder)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedData in
                self?.apodData = returnedData
                self?.obtainedData?.cancel()
            })
    }
    
    func makeURL(date: Date = Date()) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: date)
        print(dateString)
        
        let queryItemApiKey = URLQueryItem(name: "api_key", value: "OKigWxK95jFgeA6WAYWoyilBqApnnAIidzN7l9qM")
        let queryItemThumnail = URLQueryItem(name: "thumbs", value: "True")
        let queryItemDate = URLQueryItem(name: "date", value: dateString) 
        
        components.scheme = "https"
        components.host = "api.nasa.gov"
        components.path = "/planetary/apod"
        components.queryItems = [queryItemApiKey, queryItemThumnail, queryItemDate]
    }
}
