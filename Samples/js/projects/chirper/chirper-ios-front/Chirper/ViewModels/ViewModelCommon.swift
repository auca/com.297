//
//  ViewModelCommon.swift
//  Chirper
//
//  Created by Dmitrii Toksaitov on 21/5/22.
//

import Foundation

let serviceBaseURL = "http://localhost:8080"

enum ServiceError: Error {
    case error(String)
}

struct ServiceErrorReplyBody: Decodable {
    var error: String
}

struct ServiceRegisterUserPostBody: Encodable {
    var login: String
    var password: String
    var passwordRepeat: String

    enum CodingKeys: String, CodingKey {
        case login = "login"
        case password = "password"
        case passwordRepeat = "password-repeat"
    }
}

struct ServiceLoginUserPostBody: Encodable {
    var login: String
    var password: String
}

struct ServiceMessagePostBody: Encodable {
    var content: String
}

struct ServiceEmptyBody: Encodable {}
