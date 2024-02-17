//
//  Country.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 9.01.2024.
//

import Foundation

struct CountryModel {
    let code: String
    let name: String
}

struct LanguageModel {
    let code: String
    let name: String
}

struct CountryLanguageModels {
    static var countries: [CountryModel] = [
        CountryModel(code: "us", name: "United States"),
        CountryModel(code: "gb", name: "United Kingdom"),
        CountryModel(code: "fr", name: "France"),
        CountryModel(code: "de", name: "Germany"),
        CountryModel(code: "in", name: "India"),
        CountryModel(code: "jp", name: "Japan"),
        CountryModel(code: "cn", name: "China"),
        CountryModel(code: "br", name: "Brazil"),
        CountryModel(code: "au", name: "Australia"),
        CountryModel(code: "ca", name: "Canada"),
        CountryModel(code: "za", name: "South Africa"),
        CountryModel(code: "ru", name: "Russia")
    ]

    static var languages: [LanguageModel] = [
        LanguageModel(code: "de", name: "German"),
        LanguageModel(code: "en", name: "English"),
        LanguageModel(code: "es", name: "Spanish"),
        LanguageModel(code: "fr", name: "French"),
        LanguageModel(code: "he", name: "Hebrew"),
        LanguageModel(code: "it", name: "Italian"),
        LanguageModel(code: "nl", name: "Dutch"),
        LanguageModel(code: "no", name: "Norwegian"),
        LanguageModel(code: "pt", name: "Portuguese"),
        LanguageModel(code: "ru", name: "Russian"),
        LanguageModel(code: "sv", name: "Swedish"),
        LanguageModel(code: "ud", name: "Urdu"),
        LanguageModel(code: "zh", name: "Chinese")
    ]
}
