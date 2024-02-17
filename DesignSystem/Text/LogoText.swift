//
//  TitleText.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 23.12.2023.
//
import SwiftUI

struct LogoText: View {

    private let text: String
    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .lineLimit(2)
            .font(.system(size: 48, weight: .bold))
            .foregroundColor(Color.purple)
            .padding(.vertical, Spacing.spacing_4)
            .padding(.horizontal, Spacing.spacing_2)
            .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    LogoText(text: "Test")
}
