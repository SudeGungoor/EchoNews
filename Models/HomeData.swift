//
//  HomeData.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 9.01.2024.
//
import Foundation

struct HomeData: Codable {
    let status: String
    let sources: [Source1]
}

struct Source1: Codable, Hashable {
    let id, name, description: String
    let url: String
    let category: Category
    let language, country: String
}

enum Category: String, Codable {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
}
