//
//  HomeDataSource.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import Foundation

struct HomeDataSource {

    private let baseURL = "https://newsapi.org/v2/top-headlines/sources?apiKey=2edf4906b00c46d49014cb4781df3a4b"
    var delegate: HomeDataSourceDelegate?

    func loadHomeNews() {

        let session = URLSession.shared
        if let url = URL(string: baseURL) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            let dataTask = session.dataTask(with: request) { data, response, error in
                guard let data else { return }
                if let jsonString = String(data: data, encoding: .utf8) {
                    print(jsonString.count)
                }
                let decoder = JSONDecoder()
                do {
                    let homeList = try decoder.decode([News].self, from: data)
                    print(homeList)
                    DispatchQueue.main.async {
                        delegate?.homeListLoaded(homeList: homeList)
                    }
                } catch {
                    print(error)
                }
            }
            dataTask.resume()
        }
    }
}
