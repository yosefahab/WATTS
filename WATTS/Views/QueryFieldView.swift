//
//  QueryField.swift
//  Watts
//
//  Created by Youssef Ahab on 15/06/2023.
//

import SwiftUI

struct QueryFieldView: View {
    @State var query: String = String()
    let onSubmitClosure: (_ query: String) async -> Void
    @FocusState private var isFocused: Bool
    
    private func submitAndClean() async -> Void {
        let user_query = query
        query = String()
        await onSubmitClosure(user_query)
    }
    var body: some View {
        HStack {
            TextField("Enter message...", text: $query, axis: .vertical)
                .lineLimit(20)
                .textFieldStyle(PlainTextFieldStyle())
                .focused($isFocused)
            
            Button(action: { Task { await submitAndClean() } }) {
                    Image(systemName: Constants.SUBMIT_ICON)
            }
            .buttonStyle(PlainButtonStyle())
            .disabled(query.isEmpty)
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: Constants.BORDER_RADIUS)
            .stroke(isFocused ? LinearGradient(colors:[Color.cyan], startPoint: .leading, endPoint: .trailing) : Constants.USER_FRAME_COLOR))
        .padding([.horizontal, .bottom])
        .onSubmit({ Task { await submitAndClean() } })
    }
    
}

struct QueryField_Previews: PreviewProvider {
    static var previews: some View {
        QueryFieldView(query: "something to ask the great great WATTS",
                       onSubmitClosure: {query in })
    }
}
