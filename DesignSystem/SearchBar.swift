//
//  SearchBar.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 9.01.2024.
//
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var onCommit: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button {
                onCommit()
            } label: {
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(.blue)
                    .imageScale(.large)
            }
        }
        .padding()
    }
}

#Preview {
    SearchBar(searchText: .constant("test"), onCommit: {})
}
