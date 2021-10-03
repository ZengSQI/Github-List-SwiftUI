//
//  UserListViewModel.swift
//  GithubUserList-SwiftUI
//
//  Created by Steven Zeng on 2021/10/4.
//

import Foundation
import Moya
import CombineMoya

class UserListViewModel: ObservableObject {
    private let pageSize = 20
    private let provider = MoyaProvider<Github>()
    @Published private(set) var users: [User] = []

    func fetchNextPage(user: User?) {
        let token = SubscriptionToken()
        let since = user?.id ?? 0
        provider.requestPublisher(.userList(since: since, pageSize: pageSize))
            .map([User].self)
            .sink { _ in
                token.unseal()
            } receiveValue: { [weak self] users in
                if user == nil {
                    self?.users = users
                } else {
                    self?.users.append(contentsOf: users)
                }
            }.seal(in: token)
    }
}
