//
//  UserModel.swift
//  Chirper
//
//  Created by Dmitrii Toksaitov on 24/5/22.
//

import Foundation

struct UserModel: Codable {
    var id: Int
    var login: String
    var authorized: Bool?
    var administrator: Bool?
}
