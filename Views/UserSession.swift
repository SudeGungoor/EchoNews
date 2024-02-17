//
//  UserSession.swift
//  sample-figma-screen
//
//  Created by Buse Özkan on 9.01.2024.
//

import Foundation
import Firebase

class UserSession: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var isUserLoggedIn: Bool
    @Published var name: String?
    @Published var email: String?

    init() {
        self.isUserLoggedIn = Auth.auth().currentUser != nil
        self.name = Auth.auth().currentUser?.displayName
        self.email = Auth.auth().currentUser?.email
        loadUserPreferences()
    }

    func loadUserPreferences() {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        let database = Firestore.firestore()
        database.collection("users").document(userId).getDocument { [weak self] (document, error) in
            if let document = document, document.exists {
                self?.name = document.data()?["name"] as? String
                self?.email = document.data()?["email"] as? String
            } else {
                print("Document does not exist or error: \(String(describing: error))")
            }
        }
    }
}
