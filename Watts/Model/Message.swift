//
//  Message.swift
//  Watts
//
//  Created by Youssef Ahab on 15/06/2023.
//

import Foundation

struct Message: Identifiable {
    let id: UUID
    let text: String
    let isUser: Bool
    
    init(id: UUID = UUID(), text: String = String(), isUser: Bool = true) {
        self.id = id
        self.text = text
        self.isUser = isUser
    }
}
