//
//  SpaceNewsDataService.swift
//  Space Hub
//
//  Created by Jungwon Kim on 12/16/21.
//

import Foundation
import Combine

class SpaceNewsDataService {
    @Published var SpaceNews = [SpaceNewsModel(id: 0, title: "No Title", url: "No URL", imageUrl: "No URL", newsSite: "No URL", summary: "No Summary")]
    
    var obtainedData: AnyCancellable?
    var components = URLComponents()
                
    init() {
        makeURL()
        getSpaceNewsData()
    }
    
    func getSpaceNewsData() {
        print("getting data")
        guard let url = components.url else { return }
        print("URL valid")
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        obtainedData = NetworkingManager.download(url: url)
            .decode(type: [SpaceNewsModel].self, decoder: decoder)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedData in
                self?.SpaceNews = returnedData
                self?.obtainedData?.cancel()
            })
    }
    
    func makeURL(date: Date = Date()) {
        let queryItemArticleCount = URLQueryItem(name: "_limit", value: "10")
        
        components.scheme = "https"
        components.host = "api.spaceflightnewsapi.net"
        components.path = "/v3/articles"
        components.queryItems = [queryItemArticleCount]
    }
}
