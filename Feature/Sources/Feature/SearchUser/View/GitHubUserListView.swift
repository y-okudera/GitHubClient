//
//  SwiftUIView.swift
//  
//
//  Created by okudera on 2025/01/18.
//

import Core
import SwiftUI

public struct GitHubUserListView: View {

    @StateObject private var viewModel = GitHubUserListViewModel()
    private let initialQuery = "swift"

    public init() {}

    public var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // 検索バー
                SearchBar(text: $viewModel.query, placeholder: "Search GitHub Users")
                    .onChange(of: viewModel.query) { newQuery in
                        if !viewModel.query.isEmpty {
                            // クエリが変更されたら検索を実行
                            viewModel.initializeFetch(query: newQuery)
                        }
                    }

                // リストビュー
                Group {
                    if viewModel.users.isEmpty {
                        VStack {
                            Spacer()
                            if viewModel.isLoading {
                                ProgressView("Loading...")
                            } else if viewModel.query.isEmpty {
                                Text("Please search")
                            } else {
                                Text("No result")
                            }
                            Spacer()
                        }
                    } else {
                        List {
                            ForEach(viewModel.users) { user in
                                ListItem(
                                    imageUrl: user.avatarUrl,
                                    title: user.login,
                                    description: user.type,
                                    onTap: {
                                        viewModel.selectedUser = user
                                    }
                                )
                            }

                            // ページネーションのトリガー
                            if viewModel.isLoading {
                                ProgressView()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            } else {
                                Color.clear
                                    .onAppear {
                                        viewModel.fetchNextPage()
                                    }
                            }
                        }
                    }
                }
            }
            .navigationTitle("GitHub Users")
            .navigationDestination(isPresented: Binding<Bool>(
                get: { viewModel.selectedUser != nil },
                set: { if !$0 { viewModel.selectedUser = nil } }
            )) {
                if let user = viewModel.selectedUser {
                    // TODO: to next page.
                }
            }
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? "An unknown error occurred."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .onAppear {
            viewModel.initializeFetch(query: initialQuery)
        }
    }
}

#Preview {
    GitHubUserListView()
}
