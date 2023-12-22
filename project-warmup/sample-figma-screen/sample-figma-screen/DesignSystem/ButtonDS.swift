//
//  ButtonDS.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 23.12.2023.
//

import SwiftUI

struct ButtonDS: View {

    private let buttonTitle: String
    private let action: () -> Void

    init(
        buttonTitle: String,
        action: @escaping () -> Void
    ) {
        self.buttonTitle = buttonTitle
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(buttonTitle)
                .foregroundColor(.buttonText)
                .padding(.horizontal, Spacing.spacing_5)
                .padding(.vertical, Spacing.spacing_1)
                .overlay {
                    RoundedRectangle(cornerRadius: Radius.radius_4)
                        .stroke(.buttonBorder, lineWidth: 2)
                }
        }
        .padding(.vertical, Spacing.spacing_2)
    }
}

#Preview {
    ButtonDS(buttonTitle: "test") { }
}
