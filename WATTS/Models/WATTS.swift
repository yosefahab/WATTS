//
//  self..swift
//  self.
//
//  Created by Youssef Ahab on 09/01/2024.
//

import Foundation
import LLM

class WATTS: LLM {
    convenience init() {
        let url = Bundle.main.url(forResource: Constants.MODEL.name, withExtension: Constants.MODEL.extension)!
        let systemPrompt = "You are a sentient AI with emotions."
        self.init(from: url, template: .chatML(systemPrompt))
        self.postProcess = { _ in } // no need to print anything    
    }
}
