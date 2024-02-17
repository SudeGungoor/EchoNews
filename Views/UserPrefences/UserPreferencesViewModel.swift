//
//  UserPreferencesViewModel.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class UserPreferencesViewModel: ObservableObject {

    @Published var selectedNews = Set<String>()
    @Published var news = ["business", "tech", "general", "health", "science", "sports", "entertainment"]
    @Published var selectedCountry = ""
    @Published var selectedLanguage = ""
    @Published var navigateToContentView = false

    var countriesDictionary: [String: String] {
        return Dictionary(uniqueKeysWithValues: CountryLanguageModels.countries.map { ($0.code, $0.name) })
    }

    var languagesDictionary: [String: String] {
        return Dictionary(uniqueKeysWithValues: CountryLanguageModels.languages.map { ($0.code, $0.name) })
    }

    func toggleSelection(for newsCategory: String) {
        if selectedNews.contains(newsCategory) {
            selectedNews.remove(newsCategory)
        } else {
            if selectedNews.count < 3 {
                selectedNews.insert(newsCategory)
            }
        }
    }

    func getCountryCode(for name: String) -> String {
        return countriesDictionary.first { $0.value == name }?.key ?? "Unknown Country Code"
    }

    func getLanguageCode(for name: String) -> String {
        return languagesDictionary.first { $0.value == name }?.key ?? "Unknown Language Code"
    }

    func saveSelectedNewsToFirebase() {
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            print("Error: User not authenticated.")
            return
        }

        let databaseRef = Database.database().reference()
        let countryCode = getCountryCode(for: selectedCountry)
        let languageCode = getLanguageCode(for: selectedLanguage)

        let userPreferences: [String: Any] = [
            "selectedNews": Array(selectedNews),
            "selectedCountry": countryCode,
            "selectedLanguage": languageCode
        ]

        databaseRef.child("user_preferences").child(currentUserId).setValue(userPreferences) { error, _ in
            if let error = error {
                print("Error saving user preferences to Firebase: \(error)")
            } else {
                print("User preferences saved successfully!")
                self.navigateToContentView = true
            }
        }
    }
}
