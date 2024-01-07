//
//  MessageView.swift
//  Watts
//
//  Created by Youssef Ahab on 15/06/2023.
//

import SwiftUI

struct MessageView: View {
    var message: Message
    
    var body: some View {
        HStack {
            Text(message.isUser ? "<You>" : "<WATTS>")
                .bold()
                .frame(width: 65) // Horizontally aligns all messages regardless of size
                .foregroundColor(message.isUser ? Constants.USER_COLOR : Constants.WATTS_COLOR)
            Text(message.text)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(message.isUser ? Constants.USER_COLOR : Constants.WATTS_COLOR)
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: Constants.BORDER_RADIUS)
            .stroke(LinearGradient(colors: [
                Constants.ROYAL_GOLD,
                Constants.ROYAL_ORANGE
            ], startPoint: .leading, endPoint: .trailing)
            )
        )
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message(text: "A person who thinks all the time, has nothing to think about except thoughtssssssss", isUser: false)).padding(.all)
    }
}
