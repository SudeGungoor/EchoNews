//
//  FeedDetailView.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 9.01.2024.
//

import SwiftUI

struct FeedDetailView: View {
    private let article: Source1
    @StateObject private var viewModel = UserProfileViewModel()

    init(article: Source1) {
        self.article = article
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(article.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)

                Text("Published in \(viewModel.getCountryName(for: article.country))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                Text("Category \(article.category.rawValue)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                Text(article.description)
                    .font(.body)

                if let url = URL(string: article.url), UIApplication.shared.canOpenURL(url) {
                    Link("Read more", destination: url)
                        .foregroundColor(Color.blue)
                }

                Spacer()
            }
            .padding()
        }
        .navigationBarTitle(Text(article.name), displayMode: .inline)
    }
}

#Preview {
    FeedDetailView(article: Source1(
        id: "a",
        name: "Sample Article",
        description: "This is a sample description for the article. It provides a brief overview of the content.",
        url: "https://example.com",
        category: .business,
        language: "en",
        country: "us"
    ))
}
