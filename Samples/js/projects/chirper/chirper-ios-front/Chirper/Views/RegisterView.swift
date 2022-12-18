//
//  RegisterView.swift
//  Chirper
//
//  Created by Dmitrii Toksaitov on 21/5/22.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var userViewModel: UserViewModel
    
    @State var login = ""
    @State var password = ""
    @State var repeatedPassword = ""

    var body: some View {
        if userViewModel.user != nil {
            Text("Already logged in...").task {
                dismiss()
            }
        } else {
            Form {
                if let registrationError = userViewModel.registrationError {
                    ErrorView(error: registrationError, onClose: {
                        userViewModel.registrationError = nil
                    })
                }
                Text("Login:")
                TextField("Enter your login name here", text: $login)
                    .autocapitalization(.none)
                    .textContentType(.username)
                Text("Password:")
                SecureField("Enter your password here", text: $password)
                    .textContentType(.newPassword)
                Text("Repeated Password:")
                SecureField("Retype your password", text: $repeatedPassword)
                    .textContentType(.newPassword)
                HStack {
                    Button("Register") {
                        Task {
                            await userViewModel.register(login: login, password: password, repeatedPassword: repeatedPassword)
                        }
                    }.buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserViewModel())
    }
}
