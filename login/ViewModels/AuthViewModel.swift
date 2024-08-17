//
//  AuthViewModel.swift
//  login
//
//  Created by juan camilo on 11/08/24.
//

import SwiftUI
import Combine
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var user: UserModel?
    @Published var errorMessage: String?

    func register() {
        Networking.shared.register(email: email, password: password) { result in
            switch result {
            case .success:
                // Obtener información del usuario autenticado
                if let authUser = Auth.auth().currentUser {
                    self.user = UserModel(id: authUser.uid, email: authUser.email ?? "")
                }
                self.errorMessage = nil
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }

    func login() {
        Networking.shared.login(email: email, password: password) { result in
            switch result {
            case .success:
                // Obtener información del usuario autenticado
                if let authUser = Auth.auth().currentUser {
                    self.user = UserModel(id: authUser.uid, email: authUser.email ?? "")
                }
                self.errorMessage = nil
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }

    func resetPassword() {
        Networking.shared.resetPassword(email: email) { result in
            switch result {
            case .success:
                // Handle success
                self.errorMessage = nil
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
