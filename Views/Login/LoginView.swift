//
//  LoginView.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 4.01.2024.
//
import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject var userSession: UserSession

    var body: some View {
        ZStack {
            Image("login")
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
                .padding()

                if let errorMessage = viewModel.errorMessage {
                    ErrorView(errorMessage: errorMessage)
                }

                TextFieldDS(placeholder: "Email", text: $viewModel.email)
                TextFieldDS(placeholder: "Password", text: $viewModel.password, isSecure: true)

                ButtonDS(buttonTitle: "Login", action: viewModel.login)
                    .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)
                    .onReceive(viewModel.$navigateToContentView) { navigateToContentView in
                        if navigateToContentView {
                            userSession.isLoggedIn = true
                            userSession.email = viewModel.email
                        }
                    }

                NavigationLink(destination: FooterView(), isActive: $viewModel.navigateToContentView) {
                    EmptyView()
                }

                HStack {
                    SmallText(text: "If you don't have an account")
                    NavigationLink(destination: RegisterView()) {
                        SmallText(text: "Register")
                    }
                }
            }
            .padding()
        }
        .onAppear {
            if Auth.auth().currentUser != nil {
                userSession.isLoggedIn = true
                viewModel.navigateToContentView = true
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    LoginView()
        .environmentObject(UserSession())
}
