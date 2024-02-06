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
        ScrollViewReader { scrollProxy in
            GeometryReader { geometryProxy in
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 15) {
                        ForEach($messages, id: \.id) { $message in
                            MessageView(message: $message)
                                .id(message.id)
                                .scrollTransition(topLeading: .interactive, bottomTrailing: .interactive) { view, phase in
                                    view.opacity(phase.isIdentity ? 1 : 0).scaleEffect(phase.value <= 0 ? 1 : 0)}
                        }
                    }
                    .defaultScrollAnchor(.bottom)
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .contentMargins(15)
                .padding(.top, 1)
                .onChange(of: messages.count, { scrollProxy.scrollTo(messages.last?.id)
                })
                .onChange(of: geometryProxy.size) {
                    withAnimation(.easeInOut(duration: 4)) {
                        scrollProxy.scrollTo(messages.last?.id)
                    }
                }
            }
        }
        .removeFocusOnTap()
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(messages: .constant([
            Message(text: "A person who thinks all the time, has nothing to think about except thoughts.\nA person who thinks all the time, has nothing to think about except thoughts.\nA person who thinks all the time, has nothing to think about except thoughts.\nA person who thinks all the time, has nothing to think about except thoughts.", role: .WATTS),
            Message(text: "ok ok chill man"),
        ]))
    }
}
