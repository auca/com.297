//
//  MessageFormView.swift
//  Chirper
//
//  Created by Dmitrii Toksaitov on 24/5/22.
//

import SwiftUI

struct CreateMessageView: View {
    @EnvironmentObject var messageService: MessageViewModel

    @State var newMessageContent = ""

    var body: some View {
        VStack(alignment: .leading){
            Text("What's on your mind?")
                .foregroundColor(.blue)
                .fontWeight(.semibold)
            HStack {
                TextField("", text: $newMessageContent)
                    .foregroundColor(.white)
                    .frame(alignment: .leading)
                    .accentColor(.white)
                Button("Send") {
                    Task {
                        await messageService.createMessage(content: newMessageContent)
                        newMessageContent = ""
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.leading)
            .background(.blue)
            .cornerRadius(5)

            if let createMessageError = messageService.createMessageError {
                Text(createMessageError)
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .cornerRadius(5)
    }
}

struct CreateMessage_Previews: PreviewProvider {
    static var previews: some View {
        CreateMessageView()
            .environmentObject(MessageViewModel())
    }
}
