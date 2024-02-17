//
//  SearchNewsDetailView.swift
//  sample-figma-screen
//
//  Created by Buse Özkan on 6.01.2024.
//

import SwiftUI

struct SearchNewsDetailView: View {
    private let article: Article

    init(article: Article) {
        self.article = article
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .aspectRatio(contentMode: .fit)
                }

                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)

                if let author = article.author {
                    Text("By \(author)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Text("Published at \(article.publishedAt.formattedDate())")
                    .font(.caption)
                    .foregroundColor(.secondary)

                if let url = URL(string: article.url), UIApplication.shared.canOpenURL(url) {
                                    Link("Read Full Article", destination: url)
                                        .foregroundColor(Color.blue)
                                        .padding(.top, 5)
                                }

                Text(article.description )
                    .font(.body)
                    .padding(.top, 5)

                if let content = article.content {
                    Text(content)
                        .font(.body)
                        .padding(.top, 10)
                }
            }
            .padding()
        }.navigationBarTitle(article.source.name)
    }
}

extension String {
    func formattedDate() -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime]

        if let date = isoFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
}

#Preview {
    SearchNewsDetailView(article: Article(
        source: Source(id: "journal-du-geek", name: "Journal du geek"),
        author: "Chris Klippel",
        title: "L’imprimante 3D Flashforge Adventurer 5M Pro voit son prix s’effondrer !",
        description: "Pour les fêtes de fin d'année",
        url: "https:",
        urlToImage: "https:",
        publishedAt: "2023-12-18T10:46:02Z",
        content: "Et si pour Noël"
    ))
}
