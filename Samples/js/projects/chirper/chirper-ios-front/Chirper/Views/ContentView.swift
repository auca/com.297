//
//  ContentView.swift
//  Chirper
//
//  Created by Dmitrii Toksaitov on 18/5/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userViewModel = UserViewModel()
    @StateObject var messageViewModel = MessageViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if userViewModel.user != nil {
                    CreateMessageView()
                        .environmentObject(messageViewModel)
                }

                if let messages = messageViewModel.messages {
                    List(messages, id: \.self.id) { message in
                        MessageView(message: message)
                            .environmentObject(userViewModel)
                            .environmentObject(messageViewModel)
                    }
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Chirper")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if let user = userViewModel.user {
                        Button("Logout @(\(user.login))") {
                            Task {
                                await userViewModel.logout()
                            }
                        }
                    } else {
                        NavigationLink("Login", destination: LoginView().environmentObject(userViewModel))
                        NavigationLink("Register", destination: RegisterView().environmentObject(userViewModel))
                    }
                }
            }
            .task {
                await userViewModel.getLoggedInUser()
                await messageViewModel.getMessages()
            }.refreshable {
                await messageViewModel.getMessages()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
