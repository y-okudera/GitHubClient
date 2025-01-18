//
//  WebView.swift
//  
//
//  Created by okudera on 2025/01/18.
//

import SwiftUI
import WebKit

public struct WebView: UIViewRepresentable {

    private let urlString: String

    public init(urlString: String) {
        self.urlString = urlString
    }

    public func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
