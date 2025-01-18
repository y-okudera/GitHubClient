//
//  GitHubUser.swift
//  
//
//  Created by okudera on 2025/01/18.
//

import Foundation

struct GitHubUser: Decodable, Identifiable, Hashable {

    let id: Int
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let type: String
}
