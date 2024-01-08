//
//  ContentView.swift
//  Watts
//
//  Created by Youssef Ahab on 15/06/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var store: WATTStore
    var body: some View {
        VStack {
            Spacer()
            ChatView(messages: $store.messages)
            QueryFieldView(onSubmitClosure: { (query) -> Void in
                let sanitized_query = store.sanitize_text(text: query)
                store.push_message(text: sanitized_query, role: .User)
                
                let response: String = sendQuery(query)
                store.push_message(text: response, role: .WATTS)
            })
        }
        .background(Background())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(WATTStore())
    }
}
