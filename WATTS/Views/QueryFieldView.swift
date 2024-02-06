//
//  QueryField.swift
//  Watts
//
//  Created by Youssef Ahab on 15/06/2023.
//

import SwiftUI

struct QueryFieldView: View {
    @State private var query: String = String()
    @State private var WATTSTurn: Bool = false
    @FocusState private var isFocused: Bool
    
    let onSubmitClosure: (_ query: String) async -> Void
    let stopClosure: () -> Void
    
    private let focusedColor = LinearGradient(colors:[Color.cyan], startPoint: .leading, endPoint: .trailing)
    private let unfocusedColor = LinearGradient(colors: [Constants.ROYAL_BLUE, Constants.ROYAL_GOLD, Constants.ROYAL_ORANGE], startPoint: .leading, endPoint: .trailing)
    
    private func submitAndClean()  -> Void {
        // if WATTS is still processing a previous query
        if WATTSTurn { return }
        Task {
            WATTSTurn.toggle()
            let user_query = query
            query.removeAll()
            await onSubmitClosure(user_query)
            // processing complete, allow user to submit again
            WATTSTurn.toggle()
        }
    }
    var body: some View {
        HStack {
            TextField("Enter message...", text: $query, axis: .vertical)
                .lineLimit(20)
                .textFieldStyle(PlainTextFieldStyle())
                .focused($isFocused)
                .onKeyPress(.escape, action: {
                    isFocused = false
                    return .handled
                })
            
            if WATTSTurn {
                progressView
            } else {
                Button(action: submitAndClean) {
                    Image(systemName: "arrow.up.circle.fill")
                }
                .buttonStyle(.plain)
                .disabled(query.isEmpty)
            }
        }
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.BORDER_RADIUS)
                .stroke(isFocused ? focusedColor : unfocusedColor )
        )
        .padding()
        .onSubmit(submitAndClean)
    }
    private var progressView: some View {
        HStack {
            ProgressView()
                .progressViewStyle(.linear)
                .tint(Constants.ROYAL_GOLD)
                .frame(width: 25)
            Button(action: stopClosure) {
                Image(systemName: "stop.circle")
            }
            .buttonStyle(.plain)
            .foregroundStyle(.red)
        }
        
    }
    
}

struct QueryField_Previews: PreviewProvider {
    static var previews: some View {
        QueryFieldView(onSubmitClosure: {query in }, stopClosure: {})
    }
}
