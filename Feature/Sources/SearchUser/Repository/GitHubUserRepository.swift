//
//  GitHubUserRepository.swift
//
//
//  Created by okudera on 2025/01/18.
//

import Core
import SafeDI

public protocol GitHubUserRepository: Sendable {
    /// GitHubユーザーを検索
    /// - Parameters:
    ///   - query: 検索クエリ
    ///   - page: ページ番号
    /// - Returns: 検索結果
    func searchUsers(query: String, page: Int) async throws -> SearchUserResponse
}

@Instantiable(fulfillingAdditionalTypes: [GitHubUserRepository.self])
public struct GitHubUserRepositoryImpl: Instantiable, GitHubUserRepository {

    public init() {}

    public func searchUsers(query: String, page: Int) async throws -> SearchUserResponse {
        return try await APIClient.perform(
            request: SearchUserRequest(query: query, page: page),
            responseType: SearchUserResponse.self
        )
    }
}
