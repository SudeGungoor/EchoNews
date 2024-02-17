//
//  errorView.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 8.01.2024.
//

import SwiftUI

struct ErrorView: View {
    var errorMessage: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(errorMessage)
                .foregroundColor(.red)
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                .fixedSize(horizontal: false, vertical: true)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.red, lineWidth: 3)
                )
        )
        .padding()
    }
}

#Preview {
    ErrorView(errorMessage: "This is a test error message that will appear in a talking box.")
}
