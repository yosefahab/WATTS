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
                await store.sendQuery(query)
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
