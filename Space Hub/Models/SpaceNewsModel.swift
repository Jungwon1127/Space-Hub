//
//  SpaceNewsModel.swift
//  Space Hub
//
//  Created by Jungwon Kim on 12/16/21.
//

import Foundation

struct SpaceNewsModel: Codable, Identifiable {
    let id: Int
    let title, url, imageUrl, newsSite, summary: String
}
