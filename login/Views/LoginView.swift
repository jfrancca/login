//
//  LoginView.swift
//  login
//
//  Created by juan camilo on 16/08/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = AuthViewModel()

    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)

            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Button(action: {
                viewModel.login()
            }) {
                Text("Login")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .padding(.top)

            Button(action: {
                viewModel.resetPassword()
            }) {
                Text("Forgot Password?")
                    .padding()
                    .foregroundColor(.blue)
            }
            .padding(.top)

            if let user = viewModel.user {
                Text("Logged in User: \(user.email)")
                    .padding()
            }
        }
        .padding()
    }
}
