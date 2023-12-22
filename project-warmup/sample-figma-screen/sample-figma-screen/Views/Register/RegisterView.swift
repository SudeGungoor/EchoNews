//
//  ContentView.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @State private var navigateToContentView = false

    var body: some View {
        NavigationStack {
            VStack {
                TextFieldDS(placeholder: "Name", text: $name)
                TextFieldDS(placeholder: "Email", text: $email)
                TextFieldDS(placeholder: "Password", text: $password, isSecure: true)

                ButtonDS(buttonTitle: "Register") {
                    register()
                }

                NavigationLink(destination: UserPreferencesView(), isActive: $navigateToContentView) {
                    EmptyView()
                }.hidden()
            }
            .padding()
        }
    }

    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            DispatchQueue.main.async { // Ensure UI updates are on the main thread
                if let error = error {
                    print(error.localizedDescription)
                    // Consider showing an error message to the user
                } else {
                    print("Registration success")
                    if let userID = result?.user.uid {
                        let ref = Database.database().reference()
                        let user = ["name": self.name]
                        ref.child("users").child(userID).setValue(user)
                    }
                    self.navigateToContentView = true
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
