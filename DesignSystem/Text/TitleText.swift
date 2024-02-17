//
//  TitleText.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 4.01.2024.
//

import SwiftUI

struct TitleText: View {

    private let text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .lineLimit(2)
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(Color.black)
            .padding(.vertical, Spacing.spacing_4)
            .padding(.horizontal, Spacing.spacing_2)
            .shadow(color: Color.white.opacity(1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    TitleText(text: "Test")
}
