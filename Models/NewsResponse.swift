//
//  News.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable, Hashable {
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source: Codable, Hashable {
    let id: String?
    let name: String
}
