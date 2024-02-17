//
//  UserProfile.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 6.01.2024.
//

import Foundation

struct UserPreference: Codable {
    let emailAddress: String
    let selectedCountry, selectedLanguage: String
    let selectedNews: [String]
}
