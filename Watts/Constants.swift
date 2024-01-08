//
//  Constants.swift
//  Watts
//
//  Created by Youssef Ahab on 15/06/2023.
//

import Foundation
import SwiftUI

struct Constants {
    static let BORDER_RADIUS: CGFloat = 12
    
    static let ROYAL_ORANGE: Color = Color(red: 75/255, green: 56/255, blue: 49/255)
    static let ROYAL_BLUE: Color = Color(red: 65/255, green: 105/255, blue: 225/255)
    static let ROYAL_GOLD: Color = Color(red: 213/255, green: 190/255, blue: 139/255, opacity: 0.6)
    
    static let USER_FRAME_COLOR = LinearGradient(colors: [Constants.ROYAL_BLUE, Constants.ROYAL_GOLD, Constants.ROYAL_ORANGE],
                                                 startPoint: .leading, endPoint: .trailing)
    static let WATTS_FRAME_COLOR = LinearGradient(colors: [Constants.ROYAL_GOLD, Constants.ROYAL_ORANGE],
                                                  startPoint: .leading, endPoint: .trailing)
    static let WATTS_TEXT_COLOR: Color = Color(red: 245/255, green: 238/255, blue: 183/255)
    static let USER_TEXT_COLOR: Color = Color(red: 140/255, green: 155/255, blue: 200/255)
    
    static let submitIcon: String = "arrow.up.circle.fill"
}
