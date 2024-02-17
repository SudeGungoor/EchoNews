//
//  SmallText.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 4.01.2024.
//

import SwiftUI

struct SmallText: View {
    let text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(.footnote)
    }
}

#Preview {
    SmallText(text: "Test")
}
