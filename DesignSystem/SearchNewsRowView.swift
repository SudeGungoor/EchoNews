//
//  SearchNewsView.swift
//  sample-figma-screen
//
//  Created by Buse Özkan on 6.01.2024.
//

import SwiftUI

struct SearchNewsRowView: View {
    let article: Article

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            // Image
            if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            }

            // Text content
            VStack(alignment: .leading, spacing: 5) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(3)

                if let author = article.author, !author.isEmpty {
                    Text("By \(author)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Text(article.description )
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineLimit(3)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    SearchNewsRowView(article: Article(
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
