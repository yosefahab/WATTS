//
//  Message.swift
//  Watts
//
//  Created by Youssef Ahab on 15/06/2023.
//

import Foundation


public enum Role {
    case User
    case WATTS
}
struct Message: Identifiable {
    let id: UUID
    let text: String
    let role: Role
    

    init(id: UUID = UUID(), text: String = String(), role: Role = .User) {
        self.id = id
        self.text = text
        self.role = role
    }
}
