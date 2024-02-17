//
//  FeedDetailView.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 9.01.2024.
//

import SwiftUI

struct FeedRowView: View {
    let article: Source1

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text(article.name)
                    .font(.headline)
                    .lineLimit(1)

                Text(article.description)
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineLimit(3)
            }
            .padding(.vertical, 4)

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    FeedRowView(article: Source1(
        id: "a",
        name: "Sample Article",
        description: "This is a sample description for the article. It provides a brief overview of the content.",
        url: "https://example.com",
        category: .business,
        language: "en",
        country: "us"
    ))
}
