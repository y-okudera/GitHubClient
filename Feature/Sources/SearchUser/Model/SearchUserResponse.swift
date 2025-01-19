//
//  SearchUserResponse.swift
//
//
//  Created by okudera on 2025/01/18.
//

import Foundation

public struct SearchUserResponse: Decodable, Sendable {

    let totalCount: Int
    let items: [GitHubUser]
}
