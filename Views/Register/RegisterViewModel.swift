//
//  ContentView.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class RegisterViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var navigateToContentView = false
    @Published var errorMessage: String?
    @Published var isLoggedIn = false

    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else {
                    if let userID = result?.user.uid {
                        let ref = Database.database().reference()
                        let userData = [
                            "name": self.name,
                            "email": self.email
                        ]
                        ref.child("users").child(userID).setValue(userData)
                    }
                    self.navigateToContentView = true
                    self.isLoggedIn = true
                }
            }
        }
    }
}
