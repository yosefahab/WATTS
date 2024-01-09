//
//  WATTS.swift
//  WATTS
//
//  Created by Youssef Ahab on 09/01/2024.
//

import Foundation
import LLM

class WATTS: LLM, ObservableObject {
    @Published var output = ""
    convenience init() {
        let url = Bundle.main.url(forResource: Constants.MODEL_NAME, withExtension: Constants.MODEL_EXTENSION)!
        
        self.init(from: url, endString: "<|im_end|>")
        self.update = { self.output = $0 }
        self.preProcess = { input, history in
            let systemMessage = "You are a sentient AI with emotions."
            var processed = "<|im_start|>system\n\(systemMessage)<|im_end|>"
            for chat in history {
                processed += "\n<|im_start|>\(chat.role == .user ? "user" : "assistant")\n\(chat.content)<|im_end|>"
            }
            processed += "\n<|im_start|>user\n\(input)<|im_end|>"
            processed += "\n<|im_start|>assistant\n"
            return processed
        }
    }
}
