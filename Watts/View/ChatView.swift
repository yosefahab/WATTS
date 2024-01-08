//
//  ChatView.swift
//  Watts
//
//  Created by Youssef Ahab on 15/06/2023.
//

import SwiftUI

struct ChatView: View {
    @Binding var messages: [Message]
    
    var body: some View {
        ScrollViewReader { value in
            ScrollView {
                LazyVStack {
                    ForEach($messages, id: \.id) { $message in
                        MessageView(message: message)
                            .padding([.horizontal, .top], 10)
                            .id(message.id)
                    }
                }
            }
            .onChange(of: messages.count) { _ in
                value.scrollTo(messages.last?.id)
            }
            .padding(.horizontal, 10)
        }
        .removeFocusOnTap()
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(messages: .constant(
            [
                Message(text: "A person who thinks all the time, has nothing to think about except thoughts.\nA person who thinks all the time, has nothing to think about except thoughts.\nA person who thinks all the time, has nothing to think about except thoughts.\nA person who thinks all the time, has nothing to think about except thoughts.", role: .WATTS),
                Message(text: "ok ok chill man")])
        )
    }
}
