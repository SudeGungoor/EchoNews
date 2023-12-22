//
//  SignUpNewView.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        TabView{
          HomeView()
            .tabItem {
                Image("ic-home")
                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
            }
            SearchView()
                .tabItem {
                    Image("ic-search")
                        .renderingMode(.template)
                }
            ProfileView()
                .tabItem {
                    Image("ic-profile")
                        .renderingMode(.template)
                }
        }
    }
}

#Preview {
    FooterView()
}
