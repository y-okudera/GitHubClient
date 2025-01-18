//
//  GitHubUserRepository.swift
//
//
//  Created by okudera on 2025/01/18.
//

import Core

enum GitHubUserRepository {

    /// GitHubユーザーを検索
    /// - Parameters:
    ///   - query: 検索クエリ
    ///   - page: ページ番号
    /// - Returns: 検索結果
    static func searchUsers(query: String, page: Int) async throws -> SearchUserResponse {
        return try await APIClient.perform(
            request: SearchUserRequest(query: query, page: page),
            responseType: SearchUserResponse.self
        )
    }
}
