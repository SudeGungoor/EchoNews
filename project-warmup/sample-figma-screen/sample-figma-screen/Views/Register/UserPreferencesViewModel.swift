//
//  CategoryListViewModel.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//


import Foundation

class UserPreferencesViewModel: ObservableObject {

    @Published var isLoading = true
    @Published var forecastView = false
    @Published var homeList: [News] = []
    @Published var selectedCity: String?

    private var dataSource = HomeDataSource()

    init() {
        dataSource.delegate = self
    }

    func loadTopNews() {
        dataSource.loadHomeNews()
    }

    func presentSheet() {
        forecastView = true
    }
}

extension UserPreferencesViewModel: HomeDataSourceDelegate {
    func homeListLoaded(homeList: [News]) {
        isLoading = false
        self.homeList = homeList
    }
}
