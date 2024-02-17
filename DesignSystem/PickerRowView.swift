//
//  PickerRowView.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 6.01.2024.
//

import SwiftUI

struct PickerRowView: View {
    var title: String
    @Binding var selection: String
    var items: [String: String]

    var body: some View {
        VStack {
            SubtitleText(text: title)
            CustomPickerView(selection: $selection, items: Array(items.values))
        }
    }
}

#Preview {
    PickerRowView(title: "test", selection: .constant("test"), items: ["test": "String"])
}
