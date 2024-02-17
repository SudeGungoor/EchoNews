//
//  BackgroundImage.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 6.01.2024.
//

import SwiftUI

struct BackgroundImage: View {
    var body: some View {
        Image("4")
            .resizable()
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundImage()
}
