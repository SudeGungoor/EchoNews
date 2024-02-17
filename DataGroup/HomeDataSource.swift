//
//  HomeDataSource.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//
import Foundation
struct HomeDataSource {

    private let baseURL = "https://newsapi.org/v2/top-headlines/sources?"
    private let apiKey = "fcc012a33c8146228c4808b33dfdb868"
    var delegate: HomeDataSourceDelegate?

    func loadHomeNews() {
        let session = URLSession.shared
        let modifiedURL = "\(baseURL)apiKey=\(apiKey)"
        if let url = URL(string: modifiedURL) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            let dataTask = session.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    print(error ?? "Unknown error")
                    return
                }

                let decoder = JSONDecoder()
                do {
                    let homeList = try decoder.decode(HomeData.self, from: data)
                    DispatchQueue.main.async {
                        self.delegate?.homeListLoaded(homeList: homeList.sources)
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
            dataTask.resume()
        }
    }
}
