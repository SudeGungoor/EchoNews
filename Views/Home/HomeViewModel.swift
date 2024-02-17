//
//  HomeViewModel.swift
//  sample-figma-screen
//
//  Created by Buse Özkan on 6.01.2024.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import CoreData
class HomeViewModel: ObservableObject {

    private var dataSource = HomeDataSource()
    @Published var sourceList: [Source1] = []
    @Published var isLoading = true
    @Published var topics: [String] = []
    @Published var language: String = ""
    @Published var country: String = ""
    @Published var isLoaded = false
    @Published var filteredSources: [Source1] = []
    @Published var userPreferences: UserPreference?

    init() {
        dataSource.delegate = self
    }

    func loadHomeNews() {
        dataSource.loadHomeNews()
        observeUserProfileChanges()
    }

    func observeUserProfileChanges() {
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            print("Error: User not authenticated.")
            return
        }

        let databaseRef = Database.database().reference()
        let userProfileRef = databaseRef.child("user_preferences").child(currentUserId)

        userProfileRef.observe(.value) { [weak self] snapshot  in
            guard let self = self else { return }
            if let userPreferences = snapshot.value as? [String: Any] {
                DispatchQueue.main.async {
                    self.topics = userPreferences["selectedNews"] as? [String] ?? []
                    self.language = userPreferences["selectedLanguage"] as? String ?? ""
                    self.country = userPreferences["selectedCountry"] as? String ?? ""
                }
            } else {
                print("User preferences not found.")
            }
        }
    }

    func retrieveUserProfile() {
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            print("Error: User not authenticated.")
            return
        }
        let databaseRef = Database.database().reference()
        let userProfileRef = databaseRef.child("user_preferences").child(currentUserId)

        userProfileRef.observeSingleEvent(of: .value) { snapshot, _  in
            if let userPreferences = snapshot.value as? [String: Any] {
                self.topics = userPreferences["selectedNews"] as? [String] ?? []
                self.language = userPreferences["selectedLanguage"] as? String ?? ""
                self.country = userPreferences["selectedCountry"] as? String ?? ""
            } else {
                print("User preferences not found.")
            }
        }
    }

    func filterSourcesByLanguage() {
        let filteredList = sourceList.filter { source in
            let languageFilter = source.language.lowercased() == self.language.lowercased()
            return languageFilter
        }
        self.filteredSources = filteredList
    }

    func filterSourcesByCountry() {
        let filteredList = sourceList.filter { source in
            let countryFilter = source.country.lowercased() == self.country.lowercased()
            return countryFilter
        }
        self.filteredSources = filteredList
    }

    func filterSourcesByCategory() {
        let filteredList = sourceList.filter { source in
            let categoryFilter = self.topics.contains(source.category.rawValue)
            return categoryFilter
        }
        self.filteredSources = filteredList
    }
}

extension HomeViewModel: HomeDataSourceDelegate {
    func homeListLoaded(homeList: [Source1]) {
        isLoading = false
        self.sourceList = homeList
        retrieveUserProfile()
        observeUserProfileChanges()
        filteredSources = sourceList
    }
}
