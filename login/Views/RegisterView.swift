//
//  RegisterView.swift
//  login
//
//  Created by juan camilo on 16/08/24.
//

import SwiftUI

struct RegisterView: View {
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
                viewModel.register()
            }) {
                Text("Register")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .padding(.top)

            if let user = viewModel.user {
                Text("Registered User: \(user.email)")
                    .padding()
            }
        }
        .padding()
    }
}
