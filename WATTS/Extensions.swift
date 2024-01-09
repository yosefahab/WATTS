//
//  Extensions.swift
//  Watts
//
//  Created by Youssef Ahab on 15/06/2023.
//

import Foundation
import SwiftUI

public struct RemoveFocusOnTapModifier: ViewModifier {
    
    /// Removes focus from the text field when clicking away
    public func body(content: Content) -> some View { content

        // Redundant, since target is macOS only
#if os (iOS)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
#elseif os(macOS)
        .onTapGesture {
            DispatchQueue.main.async {
                NSApp.keyWindow?.makeFirstResponder(nil)
            }
        }
#endif
    }
}

extension View {
    public func removeFocusOnTap() -> some View {
        modifier(RemoveFocusOnTapModifier())
    }
}

struct TransparentEffect: NSViewRepresentable {
    /// Makes the main window transparent
  func makeNSView(context: Self.Context) -> NSView {
      return NSVisualEffectView()
  }
    
  func updateNSView(_ nsView: NSView, context: Context) { }
}
