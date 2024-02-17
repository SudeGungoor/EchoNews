//
//  ContentView.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    @EnvironmentObject var userSession: UserSession

    var body: some View {
        ZStack {
            Image("2")
                .resizable()
                .cornerRadius(20)
                .ignoresSafeArea()

            VStack {
                ZStack {
                    Image("logo")
                }
                ZStack {
                    LogoText(text: "ECHO NEWS")
                }

                if let errorMessage = viewModel.errorMessage, !errorMessage.isEmpty {
                    ErrorView(errorMessage: errorMessage)
                }

                TextFieldDS(placeholder: "Name", text: $viewModel.name)
                TextFieldDS(placeholder: "Email", text: $viewModel.email)
                TextFieldDS(placeholder: "Password", text: $viewModel.password, isSecure: true)
                ButtonDS(buttonTitle: "Register", action: viewModel.register)
                    .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty || viewModel.name.isEmpty)
                    .onReceive(viewModel.$navigateToContentView) { navigateToContentView in
                        if navigateToContentView {
                            userSession.isLoggedIn = true
                            userSession.email = viewModel.email
                            userSession.name = viewModel.name
                        }
                    }
                NavigationLink(destination: UserPreferencesView(), isActive: $viewModel.navigateToContentView) {
                    EmptyView()
                }.hidden()

                HStack {
                    SmallText(text: "Already have an account?")
                    NavigationLink(destination: LoginView()) {
                        SmallText(text: "Login")
                    }
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    RegisterView()
}
