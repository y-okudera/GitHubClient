//
//  GitHubClientApp.swift
//  GitHubClient
//
//  Created by okudera on 2025/01/17.
//

import SearchUser
import SwiftUI

@main
struct App: SwiftUI.App {

    var body: some Scene {
        WindowGroup {
            GitHubUserListView()
        }
    }
}
