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
            Text(message.role == .User ? "<You>" : "<WATTS>")
                .bold()
                .frame(width: 65) // Horizontally aligns all messages regardless of size
            Text(message.text)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(message.role == .User ?
                         Constants.USER_TEXT_COLOR : Constants.WATTS_TEXT_COLOR)
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: Constants.BORDER_RADIUS)
            .stroke(message.role == .User ?
                Constants.USER_FRAME_COLOR : Constants.WATTS_FRAME_COLOR)
        )
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MessageView(message: Message(text: "A person who thinks all the time, has nothing to think about except thoughtssssssss", role: .WATTS)).padding(.all)
            MessageView(message: Message(text: "Cool", role: .User)).padding(.all)
        }
    }
}
