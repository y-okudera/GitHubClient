//
//  WebViewPage.swift
//
//
//  Created by okudera on 2025/01/18.
//

import Core
import SwiftUI

struct WebViewPage: View {

    private let urlString: String
    private let navigationTitle: String

    init(urlString: String, navigationTitle: String) {
        self.urlString = urlString
        self.navigationTitle = navigationTitle
    }

    var body: some View {
        WebView(urlString: urlString)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(navigationTitle)
    }
}

#Preview {
    WebViewPage(urlString: "https://github.com/swift", navigationTitle: "swift")
}
