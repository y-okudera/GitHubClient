//
//  Avatar.swift
//  
//
//  Created by okudera on 2025/01/18.
//

import SwiftUI

struct Avatar: View {
    
    private let url: String
    
    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 50, height: 50)
        .clipShape(Circle())
    }
}

#Preview {
    Avatar(url: "https://avatars.githubusercontent.com/u/50235?v=4")
}
