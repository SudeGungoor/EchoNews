//
//  LinkText.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 23.12.2023.
//

import SwiftUI

struct LinkText: View {

    let text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .foregroundStyle(.linkText)
    }
}

#Preview {
    LinkText(text: "Test")
}
