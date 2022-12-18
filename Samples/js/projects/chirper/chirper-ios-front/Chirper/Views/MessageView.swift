//
//  MessageView.swift
//  Chirper
//
//  Created by Dmitrii Toksaitov on 21/5/22.
//

import SwiftUI

struct MessageView: View {
    let capitonFont = Font.system(size: 24).bold()
    let messageFont = Font.system(size: 24)
    let dateFont = Font.system(size: 18)

    let backgroundColor = Color.blue
    let foregroundColor = Color.white

    let cornerRadius = 10.0
    let spacing = 16.0

    let dateFormatter = DateFormatter()

    @State var editingEnabled = false
    @State var newMessageContent = ""

    @EnvironmentObject var userViewModel: UserViewModel;
    @EnvironmentObject var messageViewModel: MessageViewModel;

    var message: MessageModel

    init(message: MessageModel) {
        self.message = message

        dateFormatter.dateFormat = "MMM d, yyyy h:mm a"
    }

    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text("@\(message.user.login)")
                .font(capitonFont)
                .foregroundColor(foregroundColor)

            if editingEnabled {
                TextField("Type your message", text: $newMessageContent)
                    .font(messageFont)
                    .textFieldStyle(.roundedBorder)
            } else {
                Text(message.content)
                    .font(messageFont)
                    .foregroundColor(foregroundColor)
            }

            Text(dateFormatter.string(from: message.updatedAt))
                .font(dateFont)
                .foregroundColor(foregroundColor)

            if (userViewModel.user?.id == message.user.id) {
                HStack {
                    Spacer()
                    if editingEnabled {
                        Button("Done") {
                            Task {
                                await messageViewModel.editMessage(id: message.id, content: newMessageContent)
                                editingEnabled = false
                                newMessageContent = ""
                            }
                        }
                        Button("Cancel") {
                            editingEnabled = false
                            newMessageContent = ""
                        }
                    } else {
                        Button("Edit") {
                            editingEnabled = true
                        }
                        Button("Delete") {
                            Task {
                                await messageViewModel.deleteMessage(id: message.id)
                            }
                        }
                    }
                }.buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
        .onAppear {
            newMessageContent = message.content
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message:
            MessageModel(
                id: 0,
                content: "This is a sample preview message",
                createdAt: Date(),
                updatedAt: Date(),
                user: UserModel(
                    id: 0,
                    login: "admin",
                    authorized: true,
                    administrator: true
                )
            )
        )
        .environmentObject(UserViewModel())
        .environmentObject(MessageViewModel())
    }
}
