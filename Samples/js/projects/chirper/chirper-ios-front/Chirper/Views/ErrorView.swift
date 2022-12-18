//
//  ErrorView.swift
//  Chirper
//
//  Created by Dmitrii Toksaitov on 24/5/22.
//

import SwiftUI

struct ErrorView: View {
    let capitonFont = Font.system(size: 24).bold()
    let messageFont = Font.system(size: 24)

    let backgroundColor = Color.red
    let foregroundColor = Color.white

    let cornerRadius = 10.0
    let spacing = 16.0

    var error: String
    var onClose: (() -> Void)?

    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            HStack {
                Text("Error")
                    .font(capitonFont)
                Spacer()
                if let onClose = onClose {
                    Button(role: .destructive, action: { onClose() }) {
                        Label("", systemImage: "xmark.circle.fill")
                    }.font(messageFont)
                }
            }
            Text(error)
                .font(messageFont)
        }
        .foregroundColor(foregroundColor)
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Something went wrong...")
    }
}
