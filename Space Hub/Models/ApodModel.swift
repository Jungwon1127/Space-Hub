//
//  ApodModel.swift
//  Space Hub
//
//  Created by Jungwon Kim on 11/4/21.
//

import Foundation

struct ApodModel: Codable {
    let date: String
    let explanation: String
    let url: String
    let thumbnailUrl: String?
    let title: String
}
