//
//  SwiftUIView.swift
//  
//
//  Created by okudera on 2025/01/18.
//

import SwiftUI

public struct ListItem: View {

    private let imageUrl: String
    private let title: String
    private let description: String
    private let onTap: () -> Void

    public init(imageUrl: String, title: String, description: String, onTap: @escaping () -> Void) {
        self.imageUrl = imageUrl
        self.title = title
        self.description = description
        self.onTap = onTap
    }

    public var body: some View {
        HStack(spacing: 16) {
            Avatar(url: imageUrl)
                .frame(width: 50, height: 50)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)

                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .contentShape(Rectangle()) // 全体をタップ領域とする
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    ListItem(
        imageUrl: "https://avatars.githubusercontent.com/u/50235?v=4",
        title: "swift",
        description: "https://api.github.com/users/swift",
        onTap: {}
    )
}
