//
//  LoadingView.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {
        VStack(spacing: 0.8) {
            ProgressView()
            Text("Loading...")
        }
    }
}

#Preview {
    LoadingView()
}
