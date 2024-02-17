//
//  SignUpNewView.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import SwiftUI

struct FooterView: View {
    @EnvironmentObject var userSession: UserSession
    @State private var selectedTab = 0

    var body: some View {
        Group {
            if userSession.isLoggedIn == true {
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                        .tag(0)

                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                        .tag(1)

                    ProfileView()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                        .tag(2)
                }
            } else {
                LoginView()
            }
        }
        .onReceive(userSession.$isLoggedIn) { isLoggedIn in
                   if !isLoggedIn {
                       self.selectedTab = 0
                   }
               }
    }
}

#Preview {
    FooterView()
        .environmentObject(UserSession())
}
