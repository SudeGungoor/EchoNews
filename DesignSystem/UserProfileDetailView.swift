//
//  UserProfileDetailView.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 6.01.2024.
//

import SwiftUI

struct UserProfileDetailView: View {
    let user: UserPreference

    var body: some View {
        VStack {
            Text("User Profile")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            VStack(alignment: .leading, spacing: 10) {
                Text("Email Address: \(user.emailAddress)")
                Text("Language: \(user.selectedLanguage)")
                Text("Country: \(user.selectedCountry)")

                Text("Topics: \(user.selectedNews.joined(separator: ", "))")
            }
            .padding()

            Spacer()
        }
    }
}
