//
//  HomeView.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedFilterOption: String? = "All"
    private let filterOptions = ["All", "Category", "Country", "Language"]

    var body: some View {
        VStack {
            if viewModel.isLoading {
                LoadingView()
                    .onAppear {
                        viewModel.loadHomeNews()
                    }
            } else {
                Picker("Filter", selection: $selectedFilterOption) {
                    ForEach(filterOptions, id: \.self) { option in
                        Text(option).tag(option as String?)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                List(viewModel.filteredSources, id: \.self) { article in
                    NavigationLink {
                        FeedDetailView(article: article)
                    } label: {
                        FeedRowView(article: article)
                    }
                }
                .navigationBarHidden(true)
            }
        }
        .onChange(of: selectedFilterOption) { _ in
            applyFilter(selectedFilterOption)
        }
        .onAppear {
            viewModel.retrieveUserProfile()
        }
    }

    private func applyFilter(_ filterOption: String?) {
        switch filterOption {
        case "Country":
            viewModel.filterSourcesByCountry()
        case "Language":
            viewModel.filterSourcesByLanguage()
        case "Category":
            viewModel.filterSourcesByCategory()
        case "All":
            viewModel.filteredSources = viewModel.sourceList
        default:
            break
        }
    }
}

#Preview {
    HomeView()
}
