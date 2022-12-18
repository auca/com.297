//
//  MessageViewModel.swift
//  Chirper
//
//  Created by Dmitrii Toksaitov on 20/5/22.
//

import Foundation

@MainActor
class MessageViewModel: ObservableObject {
    @Published var messages: [MessageModel]? = nil

    @Published var getMessagesError:   String? = nil
    @Published var createMessageError: String? = nil
    @Published var editMessageError:   String? = nil
    @Published var deleteMessageError: String? = nil

    func getMessages() async {
        getMessagesError = nil

        messages = await performGetRequest(
            endpoint: "\(serviceBaseURL)/messages",
            onServiceError: { self.getMessagesError = $0 }
        )
        messages = messages?.reversed()
    }
    
    func createMessage(content: String) async {
        createMessageError = nil

        let createdMessage = await performPostRequest(
            endpoint: "\(serviceBaseURL)/message/create",
            body: ServiceMessagePostBody(content: content),
            onServiceError: { self.createMessageError = $0 }
        ) as MessageModel?

        if let messages = messages, let createdMessage = createdMessage {
            self.messages = [createdMessage] + messages
        }
    }
    
    func editMessage(id: Int, content: String) async {
        editMessageError = nil

        let editedMessage = await performPostRequest(
            endpoint: "\(serviceBaseURL)/message/\(id)/edit",
            body: ServiceMessagePostBody(content: content),
            onServiceError: { self.editMessageError = $0 }
        ) as MessageModel?

        if let messages = messages, let editedMessage = editedMessage {
            self.messages = messages.map { $0.id == editedMessage.id ? editedMessage : $0 }
        }
    }

    func deleteMessage(id: Int) async {
        deleteMessageError = nil

        let deletedMessageID = await performPostRequest(
            endpoint: "\(serviceBaseURL)/message/\(id)/delete",
            onServiceError: { self.deleteMessageError = $0 }
        ) as String?

        if let messages = messages, let deletedMessageID = deletedMessageID {
            self.messages = messages.filter { $0.id != Int(deletedMessageID) }
        }
    }
}
