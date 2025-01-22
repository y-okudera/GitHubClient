//
//  GitHubClientApp.swift
//  GitHubClient
//
//  Created by okudera on 2025/01/17.
//

import SafeDI
import SearchUser
import SwiftUI

@Instantiable(isRoot: true)
@main
public struct App: Instantiable, SwiftUI.App {

    public init(
        gitHubUserRepository: any GitHubUserRepository,
        gitHubUserListViewBuilder: Instantiator<GitHubUserListView>
    ) {
        self.gitHubUserRepository = gitHubUserRepository
        self.gitHubUserListViewBuilder = gitHubUserListViewBuilder
    }

    @Instantiated private let gitHubUserRepository: any GitHubUserRepository
    @Instantiated private let gitHubUserListViewBuilder: Instantiator<GitHubUserListView>

    public var body: some Scene {
        WindowGroup {
            gitHubUserListViewBuilder.instantiate()
        }
    }
}
