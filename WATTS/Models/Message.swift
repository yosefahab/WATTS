//
//  Message.swift
//  Watts
//
//  Created by Youssef Ahab on 15/06/2023.
//

import Foundation
import SwiftUI

public enum Role: String {
    case User
    case WATTS
    
    static let WATTS_TEXT_COLOR: Color = Color(red: 245/255, green: 238/255, blue: 183/255)
    static let USER_TEXT_COLOR: Color = Color(red: 140/255, green: 155/255, blue: 200/255)
    
    static let USER_FRAME_COLOR = LinearGradient(colors: [Constants.ROYAL_BLUE, Constants.ROYAL_GOLD, Constants.ROYAL_ORANGE], startPoint: .leading, endPoint: .trailing)
    static let WATTS_FRAME_COLOR = LinearGradient(colors: [Constants.ROYAL_GOLD, Constants.ROYAL_ORANGE], startPoint: .leading, endPoint: .trailing)
    
    var name: String {
        return self == .User ? "<You>" : "<WATTS>"
    }
    var textColor: Color {
        return self == .User ? Self.USER_TEXT_COLOR : Self.WATTS_TEXT_COLOR
    }    
    var frameColor: LinearGradient {
        return self == .User ? Self.USER_FRAME_COLOR : Self.WATTS_FRAME_COLOR
    }
}


struct Message: Identifiable {
    let id: UUID
    var text: String
    let role: Role
    
    init(id: UUID = UUID(), text: String = String(), role: Role = .User) {
        self.id = id
        self.text = text
        self.role = role
    }
}
