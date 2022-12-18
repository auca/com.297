//
//  MessageModel.swift
//  Chirper
//
//  Created by Dmitrii Toksaitov on 24/5/22.
//

import Foundation

struct MessageModel: Codable {
    var id: Int
    var content: String
    var createdAt: Date
    var updatedAt: Date
    var user: UserModel
}
