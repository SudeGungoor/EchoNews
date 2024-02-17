//
//  SearchViewModel.swift
//  sample-figma-screen
//
//  Created by Buse Özkan on 6.01.2024.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class SearchViewModel: ObservableObject {

    private var dataSource = SearchDataSource()
    @Published var searchList: [Article] = []
    @Published var isLoading = true

    init() {
        dataSource.delegate = self
    }

    func loadSearchNews(search: String) {
        dataSource.loadSearchNews(search: search)
    }

    func convertStringToDate(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: dateString)
    }

    func sortArticlesByNewest() {
        self.searchList.sort {
            guard let date1 = convertStringToDate($0.publishedAt),
                  let date2 = convertStringToDate($1.publishedAt) else {
                return false
            }
            return date1 > date2
        }
    }

    func sortArticlesByOldest() {
        self.searchList.sort {
            guard let date1 = convertStringToDate($0.publishedAt),
                  let date2 = convertStringToDate($1.publishedAt) else {
                return false
            }
            return date1 < date2
        }
    }
}

extension SearchViewModel: SearchDataSourceDelegate {
    func searchListLoaded(searchList: [Article]) {
        isLoading = false
        self.searchList = searchList
    }
}
