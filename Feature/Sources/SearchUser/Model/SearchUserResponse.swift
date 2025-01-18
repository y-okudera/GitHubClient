//
//  SearchUserResponse.swift
//
//
//  Created by okudera on 2025/01/18.
//

import Foundation

struct SearchUserResponse: Decodable {
    
    let totalCount: Int
    let items: [GitHubUser]
}
