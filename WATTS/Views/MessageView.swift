//
//  MessageView.swift
//  Watts
//
//  Created by Youssef Ahab on 15/06/2023.
//

import SwiftUI

struct MessageView: View {
    @Binding var message: Message
    
    var body: some View {
        HStack {
            Text(message.role.name)
                .bold()
                .frame(width: 65) // Horizontally aligns all messages regardless of size
            Text(message.text)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(10)
        .foregroundColor(message.role.textColor)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.BORDER_RADIUS)
                .stroke(message.role.frameColor)
        )
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MessageView(message: .constant(Message(text: "A person who thinks all the time, has nothing to think about except thoughtssssssss", role: .WATTS)))
            MessageView(message: .constant(Message(text: "Cool", role: .User)))
        }
    }
}
