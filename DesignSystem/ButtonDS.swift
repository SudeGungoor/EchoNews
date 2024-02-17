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
                .foregroundColor(.white)
                .bold()
                .padding(.horizontal, 48)
                .padding(.vertical, 1)
                .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: Radius.radius_5)
                .foregroundColor(.buttonBorder)
        )
        .overlay(
            RoundedRectangle(cornerRadius: Radius.radius_5)
                .stroke(.buttonBorder, lineWidth: 1)
        )
        .padding(.vertical, Spacing.spacing_2)
    }
}

#Preview {
    ButtonDS(buttonTitle: "test") { }
}
