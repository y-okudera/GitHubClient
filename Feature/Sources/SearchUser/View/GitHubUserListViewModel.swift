//
//  GitHubUserListViewModel.swift
//
//
//  Created by okudera on 2025/01/18.
//

import SwiftUI

@MainActor
final class GitHubUserListViewModel: ObservableObject {

    @Published private(set) var users: [GitHubUser] = []
    @Published private(set) var isLoading: Bool = false
    @Published var query = ""
    @Published var showingAlert = false
    @Published private(set) var errorMessage: String? {
        didSet {
            showingAlert = errorMessage != nil
        }
    }
    @Published var selectedUser: GitHubUser?

    private let gitHubUserRepository: GitHubUserRepository
    private var currentPage = 1
    private var canLoadMore = true

    // TODO: DI
    init(gitHubUserRepository: GitHubUserRepository = GitHubUserRepositoryImpl()) {
        self.gitHubUserRepository = gitHubUserRepository
    }

    /// ユーザーリストを初期化して取得
    func initializeFetch(query: String) {
        self.query = query
        currentPage = 1
        canLoadMore = true
        users = []
        fetchNextPage()
    }

    /// ユーザーリストの次のページを取得
    func fetchNextPage() {
        guard !isLoading && canLoadMore else { return }

        isLoading = true
        errorMessage = nil

        Task {
            do {
                let result = try await self.gitHubUserRepository.searchUsers(query: query, page: currentPage)
                await MainActor.run {
                    self.users.append(contentsOf: result.items)
                    self.isLoading = false
                    self.currentPage += 1
                    self.canLoadMore = self.users.count < result.totalCount
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
}
