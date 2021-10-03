//
//  UserDetailViewModel.swift
//  GithubUserList-SwiftUI
//
//  Created by Steven Zeng on 2021/10/4.
//

import Foundation
import Moya
import CombineMoya

class UserDetailViewModel: ObservableObject {
    private let provider = MoyaProvider<Github>()
    @Published private(set) var avatarURL: URL? = nil
    @Published private(set) var name: String = ""
    @Published private(set) var bio: String = ""
    @Published private(set) var login: String = ""
    @Published private(set) var location: String = ""
    @Published private(set) var blog: String = ""

    func fetchDetail(login: String) {
        let token = SubscriptionToken()
        provider.requestPublisher(.userDetail(login: login))
            .map(UserDetail.self)
            .sink { completion in
                guard case let .failure(error) = completion else { return }
                print(error)
                token.unseal()
            } receiveValue: { [weak self] userDetail in
                self?.avatarURL = userDetail.avatarURL
                self?.name = userDetail.name ?? ""
                self?.bio = userDetail.bio ?? ""
                self?.login = userDetail.login
                self?.location = userDetail.location ?? ""
                self?.blog = userDetail.blog
            }.seal(in: token)

    }
}
