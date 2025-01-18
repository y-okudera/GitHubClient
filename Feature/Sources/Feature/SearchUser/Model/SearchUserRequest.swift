//
//  SearchUserRequest.swift
//
//
//  Created by okudera on 2025/01/18.
//

import Core
import Foundation

/// GitHub ユーザ検索 API リクエスト
struct SearchUserRequest: APIRequest {

    let query: String
    let page: Int

    init(query: String, page: Int) {
        self.query = query
        self.page = page
    }

    var baseUrl: String {
        return "https://api.github.com"
    }

    var path: String {
        return "/search/users"
    }

    var method: HTTPMethod {
        return .get
    }

    var queryItems: [URLQueryItem]? {
        return [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "page", value: "\(page)")
        ]
    }
}
