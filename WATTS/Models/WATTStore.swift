//
//  Store.swift
//  Watts
//
//  Created by Youssef Ahab on 07/01/2024.
//

import Foundation

class WATTStore: ObservableObject {
    @Published var messages: [Message] = [Message(text: "Welcome! how can i help you?", role: .WATTS)]
    private let watts = WATTS()
    
    /** Sanitizes text, removing possibly malicious characters
     - Parameter text: The text to sanitize
     */
    private func sanitize_text(text: String) -> String {
        // TODO: Implement
        return text
    }
    
    /**
     Sends a message query to the LLM and updates the messages array
     - Parameter message: The user's query
     */
    public func sendQuery(_ query: String) async -> Void {
        
        // first sanitize the text, then push it to the messages array
        let sanitized_query = self.sanitize_text(text: query)
        await MainActor.run { // updates to published variables need to happen on the main thread
            self.messages.append(Message(text: sanitized_query, role: .User))
        }
        
        // get the LLM's response and adds it to the messages array
        Task {
            await watts.respond(to: query)
            DispatchQueue.main.async {
                self.messages.append(Message(text: self.watts.output, role: .WATTS))
            }
        }
    }
}
