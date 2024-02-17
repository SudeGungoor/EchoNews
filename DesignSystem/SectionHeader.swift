//
//  SectionHeader.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 6.01.2024.
//

import SwiftUI

struct SectionHeader: View {
    var title: String
    var body: some View {
        HStack { Text(title).bold(); Spacer() }
    }
}
#Preview {
    SectionHeader(title: "test")
}
