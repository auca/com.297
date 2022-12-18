//
//  LoginView.swift
//  Chirper
//
//  Created by Dmitrii Toksaitov on 21/5/22.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var userViewModel: UserViewModel

    @State var login = ""
    @State var password = ""

    var body: some View {
        if userViewModel.user != nil {
            Text("Already logged in...").task {
                dismiss()
            }
        } else {
            Form {
                if let loginError = userViewModel.loginError {
                    ErrorView(error: loginError, onClose: {
                        userViewModel.loginError = nil
                    })
                }
                Text("Login:")
                TextField("Enter your login name here", text: $login)
                    .autocapitalization(.none)
                    .textContentType(.username)
                Text("Password:")
                SecureField("Enter your password here", text: $password)
                    .textContentType(.password)
                HStack {
                    Button("Login") {
                        Task {
                            await userViewModel.login(login: login, password: password)
                        }
                    }.buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserViewModel())
    }
}
