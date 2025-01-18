//
//  SearchBar.swift
//
//
//  Created by okudera on 2025/01/18.
//

import SwiftUI

public struct SearchBar: View {

    @Binding public var text: String
    public var placeholder: String

    public init(text: Binding<String>, placeholder: String = "Search") {
        self._text = text
        self.placeholder = placeholder
    }

    public var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)

            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    StatefulPreviewWrapper("") { SearchBar(text: $0, placeholder: "Search GitHub Users") }
        .previewLayout(.sizeThatFits)
        .padding()
}
