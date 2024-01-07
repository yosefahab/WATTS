//
//  WattsApp.swift
//  Watts
//
//  Created by Youssef Ahab on 15/06/2023.
//

import SwiftUI

@main
struct WattsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .frame(idealWidth: NSScreen.main!.frame.width/2, alignment: .center)
                .background(TransparentEffect())
                .environmentObject(WATTStore())
        }
        .windowStyle(.hiddenTitleBar)
    }
}
