//
//  News.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import Foundation

struct News: Codable, Hashable {
    let status: String
    let sources: [Source]
}

struct Source: Codable, Hashable {
    let id, name, description: String
    let url: String
    let category: Category
    let language, country: String
}

enum Category: String, Codable {
    case business = "business"
    case entertainment = "entertainment"
    case general = "general"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
}
