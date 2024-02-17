//
//  ProfileViewModel.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 6.01.2024.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class UserProfileViewModel: ObservableObject {
    @Published var topics: [String] = []
    @Published var emailAddress: String = ""
    @Published var language: String = ""
    @Published var country: String = ""
    @Published var name: String = ""
    @Published var isLoading = true
    @Published var isLoggedin = false
    @Published var isEditingProfile = false
    @Published var news = ["business", "tech", "general", "health", "science", "sports", "entertainment"]

    var countriesDictionary: [String: String] {
        return Dictionary(uniqueKeysWithValues: CountryLanguageModels.countries.map { ($0.code, $0.name) })
    }
    var languagesDictionary: [String: String] {
        return Dictionary(uniqueKeysWithValues: CountryLanguageModels.languages.map { ($0.code, $0.name) })
    }
    func retrieveUserProfile() {
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            print("Error: User not authenticated.")
            return
        }

        retrieveUserDataFromUsersTable(userId: currentUserId)
        retrieveUserPreferences(userId: currentUserId)
    }

    func retrieveUserDataFromUsersTable(userId: String) {
        let databaseRef = Database.database().reference()
        let userProfileRef2 = databaseRef.child("users").child(userId)

        userProfileRef2.observeSingleEvent(of: .value) { snapshot in
            if let userPreferences2 = snapshot.value as? [String: Any] {
                self.name = userPreferences2["name"] as? String ?? ""
                self.emailAddress = userPreferences2["email"] as? String ?? ""
            } else {
                print("User Name and email not found.")
            }
        }
    }
    func toggleTopic(topic: String) {
        if topics.contains(topic) {
            topics.removeAll { $0 == topic }
        } else {
            topics.append(topic)
        }
    }
    func retrieveUserPreferences(userId: String) {
        let databaseRef = Database.database().reference()
        let userProfileRef = databaseRef.child("user_preferences").child(userId)

        userProfileRef.observeSingleEvent(of: .value) { snapshot in
            if let userPreferences = snapshot.value as? [String: Any] {
                self.topics = userPreferences["selectedNews"] as? [String] ?? []
                self.language = userPreferences["selectedLanguage"] as? String ?? ""
                self.country = userPreferences["selectedCountry"] as? String ?? ""
            } else {
                print("User preferences not found.")
            }
        }
    }

    func updateTopics(newTopics: [String]) {
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            print("Error: User not authenticated.")
            return
        }

        let databaseRef = Database.database().reference()
        let userProfileRef = databaseRef.child("user_preferences").child(currentUserId)

        let topicsUpdate = ["selectedNews": newTopics]

        userProfileRef.updateChildValues(topicsUpdate) { error, _ in
            if let error = error {
                print("Error updating topics: \(error.localizedDescription)")
            } else {
                self.topics = newTopics
            }
        }
    }

    func getCountryName(for code: String) -> String {
        return CountryLanguageModels.countries.first { $0.code == code }?.name ?? "Unknown Country"
    }

    func getLanguageName(for code: String) -> String {
        return CountryLanguageModels.languages.first { $0.code == code }?.name ?? "Unknown Language"
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
