//
//  GitHubUserRepository.swift
//
//
//  Created by okudera on 2025/01/18.
//

import Core

protocol GitHubUserRepository: Sendable {
    /// GitHubユーザーを検索
    /// - Parameters:
    ///   - query: 検索クエリ
    ///   - page: ページ番号
    /// - Returns: 検索結果
    func searchUsers(query: String, page: Int) async throws -> SearchUserResponse
}

struct GitHubUserRepositoryImpl: GitHubUserRepository {

    func searchUsers(query: String, page: Int) async throws -> SearchUserResponse {
        return try await APIClient.perform(
            request: SearchUserRequest(query: query, page: page),
            responseType: SearchUserResponse.self
        )
    }
}
