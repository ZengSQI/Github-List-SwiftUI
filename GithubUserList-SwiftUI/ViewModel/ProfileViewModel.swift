//
//  ProfileViewModel.swift
//  GithubUserList-SwiftUI
//
//  Created by Steven Zeng on 2021/10/4.
//

import Foundation
import Moya
import CombineMoya

class ProfileViewModel: ObservableObject {
    private let provider = MoyaProvider<Github>()
    @Published private(set) var avatarURL: URL? = nil
    @Published private(set) var name: String = ""
    @Published private(set) var login: String = ""
    @Published private(set) var followers: String = ""
    @Published private(set) var following: String = ""
    @Published private(set) var email: String = ""


    func fetchProfile() {
        let token = SubscriptionToken()
        provider.requestPublisher(.selfDetail)
            .map(UserDetail.self)
            .sink { completion in
                guard case let .failure(error) = completion else { return }
                print(error)
                token.unseal()
            } receiveValue: { [weak self] userDetail in
                self?.avatarURL = userDetail.avatarURL
                self?.name = userDetail.name ?? ""
                self?.login = userDetail.login
                self?.followers = "\(userDetail.followers)"
                self?.following = "\(userDetail.following)"
                self?.email = userDetail.email ?? ""
            }.seal(in: token)

    }
}
