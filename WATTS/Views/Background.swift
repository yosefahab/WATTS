//
//  Background.swift
//  Watts
//
//  Created by Youssef Ahab on 07/01/2024.
//

import SwiftUI

struct Background: View {
    var body: some View {
        LinearGradient(colors: [
            Color.black,
            Constants.ROYAL_BLUE.opacity(0.2),
            Constants.ROYAL_ORANGE,
            Constants.ROYAL_GOLD.opacity(0.6),
            Constants.ROYAL_ORANGE,
            Constants.ROYAL_BLUE.opacity(0.2),
            Color.black,
        ],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .blur(radius: 100, opaque: false)
    }    }

#Preview {
    Background()
}
