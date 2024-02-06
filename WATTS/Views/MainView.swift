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
            ChatView(messages: $store.messages)
            QueryFieldView(onSubmitClosure: { query in
                await store.sendQuery(query)
            }, stopClosure: store.stop)
        }
        .background(Background())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(WATTStore())
    }
}
