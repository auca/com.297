//
//  UserViewModel.swift
//  Chirper
//
//  Created by Dmitrii Toksaitov on 20/5/22.
//

import Foundation

@MainActor
class UserViewModel: ObservableObject {
    @Published var user: UserModel? = nil

    @Published var registrationError: String? = nil
    @Published var loginError:        String? = nil
    @Published var logoutError:       String? = nil

    @Published var getLoggedInUserError: String? = nil

    func register(login: String, password: String, repeatedPassword: String) async {
        registrationError = nil

        user = await performPostRequest(
            endpoint: "\(serviceBaseURL)/register",
            body: ServiceRegisterUserPostBody(
                login: login,
                password: password,
                passwordRepeat: repeatedPassword
            ),
            onServiceError: { self.registrationError = $0 }
        )
    }

    func login(login: String, password: String) async {
        loginError = nil

        user = await performPostRequest(
            endpoint: "\(serviceBaseURL)/login",
            body: ServiceLoginUserPostBody(
                login: login,
                password: password
            ),
            onServiceError: { self.loginError = $0 }
        )
    }

    func logout() async {
        logoutError = nil

        user = await performPostRequest(
            endpoint: "\(serviceBaseURL)/logout",
            onServiceError: { self.logoutError = $0 }
        )
    }

    func getLoggedInUser() async {
        getLoggedInUserError = nil

        user = await performGetRequest(
            endpoint: "\(serviceBaseURL)/user",
            onServiceError: { self.getLoggedInUserError = $0 }
        )
    }
}
