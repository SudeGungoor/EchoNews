//
//  LoginViewModel.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 4.01.2024.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var navigateToContentView = false
    @Published var errorMessage: String?
    @Published var isLoggedIn = false

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (_, error) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else {
                    self.navigateToContentView = true
                    self.isLoggedIn = true
                }
            }
        }
    }

    func saveUserAccount() {
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
    }
}
