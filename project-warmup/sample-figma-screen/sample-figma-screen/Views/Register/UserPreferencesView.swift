//
//  CategoryListView.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//
import SwiftUI

struct UserPreferencesView: View {
    let news = ["business", "entertainment", "general", "health", "science", "sports", "technology"]

    @State private var selectedNews = Set<String>()

    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            ScrollView {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                    VStack {
                        HStack {
                            TitleText(text: "Topics you are interested in:")
                            Spacer()
                        }
                        ForEach(news, id: \.self) { new in
                            HStack {
                                Image(systemName: selectedNews.contains(new) ? "checkmark.square.fill" : "square")
                                    .foregroundColor(selectedNews.contains(new) ? .blue : .gray)
                                    .onTapGesture {
                                        toggleSelection(for: new)
                                    }
                                SubtitleText(text: new) // Using SubtitleText
                                Spacer()
                            }

                        }
                    }
                }
                .padding(.horizontal, Spacing.spacing_2)
            }
        }
    }

    private func toggleSelection(for newsCategory: String) {
        if selectedNews.contains(newsCategory) {
            selectedNews.remove(newsCategory)
        } else {
            if selectedNews.count < 3 {
                selectedNews.insert(newsCategory)
            }
        }
    }
}

#Preview {
    UserPreferencesView()
}
