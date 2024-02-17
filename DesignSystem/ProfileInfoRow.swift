//
//  ProfileInfoRow.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 6.01.2024.
//

import SwiftUI

struct ProfileInfoRow: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
        }
    }
}

#Preview {
    ProfileInfoRow(label: "test", value: "test")
}
