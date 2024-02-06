//
//  Store.swift
//  Watts
//
//  Created by Youssef Ahab on 07/01/2024.
//

import Foundation

class WATTStore: ObservableObject {
    static private let DEFAULT_MESSAGE = Message(text: "Welcome! how can i help you?", role: .WATTS)
    @Published var messages: [Message]
    private let watts: WATTS
    init(messages: [Message] = [DEFAULT_MESSAGE]) {
        // TODO: optionally create a new chat with provided history ([Message]), should help when restoring chats
        /// First message in the chat
        self.messages = messages
        self.watts = WATTS()
    }
    /** Sanitizes text, removing possibly malicious characters
     - Parameter text: The text to sanitize
     */
    static private func sanitize_text(text: String) -> String {
        // TODO: Implement
        return text
    }
    
    /**
     Sends a message query to the LLM and updates the messages array
     - Parameter message: The user's query
     */
    public func sendQuery(_ query: String) async -> Void {
        // first sanitize the text, then push it to the messages array
        let sanitized_query = Self.sanitize_text(text: query)
        await MainActor.run { // updates to published variables need to happen on the main thread
            messages.append(Message(text: query, role: .User))
            
            // prepend the message, it will then be updated using the AsyncStream later
            messages.append(Message(text: "", role: .WATTS))
        }
        
        // TODO: this should probably be moved to WATTS and pass a closure to update the messages array from there
        await watts.respond(to: sanitized_query) { [self] response in
            await watts.setOutput(to: "")
            for await responseDelta in response {
                await MainActor.run { // updates to published variables need to happen on the main thread
                    messages[messages.count-1].text += responseDelta
                }
                await watts.setOutput(to: watts.output + responseDelta)
            }
            let trimmedOutput = watts.output.trimmingCharacters(in: .whitespacesAndNewlines)
            await watts.setOutput(to: trimmedOutput.isEmpty ? "..." : trimmedOutput)
            // final copy
            await MainActor.run { // updates to published variables need to happen on the main thread
                messages[messages.count-1].text = watts.output
            }
            return watts.output
        }
    }
    public func stop() {
        self.watts.stop()
    }
}
