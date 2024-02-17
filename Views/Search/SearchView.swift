//
//  SearchView.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//
import SwiftUI
struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var searchText = ""
    @State private var sortingOption = "Newest"
    @State private var showSortingOptions = false

    var body: some View {
        VStack {
            HStack {
                SearchBar(searchText: $searchText) {
                    viewModel.loadSearchNews(search: searchText)
                }
                SortingActionSheetView(isPresented: $showSortingOptions) { selectedOption in
                    if selectedOption == "Newest" {
                        viewModel.sortArticlesByNewest()
                    } else if selectedOption == "Oldest" {
                        viewModel.sortArticlesByOldest()
                    }
                }
            }
            .padding()
            Spacer()
            if viewModel.isLoading {
                LoadingView()
            } else {
                List(viewModel.searchList, id: \.self) { article in
                    NavigationLink {
                        SearchNewsDetailView(article: article)
                    } label: {
                        SearchNewsRowView(article: article)
                    }
                }
            }
        }
        .onAppear {
            if searchText.isEmpty {
                viewModel.loadSearchNews(search: "echo")
            } else {
                viewModel.loadSearchNews(search: searchText)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    SearchView()
}
