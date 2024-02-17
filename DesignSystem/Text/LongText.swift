//
//  LongText.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 23.12.2023.
//

import SwiftUI

struct LongText: View {

    let text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .lineLimit(30)
    }
}

struct LongText_Previews: PreviewProvider {
    static var previews: some View {
        LongText(text: "Test")
    }
}
