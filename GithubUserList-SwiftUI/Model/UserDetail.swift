//
//  UserDetail.swift
//  GithubUserList-SwiftUI
//
//  Created by Steven Zeng on 2021/10/3.
//

import Foundation

struct UserDetail: Codable {
    let login: String
    let id: Int
    let avatarURL: URL
    let type: String
    let name: String?
    let bio: String?
    let location: String?
    let blog: String
    let email: String?
    let followers: Int
    let following: Int

    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarURL = "avatar_url"
        case type
        case name
        case bio
        case location
        case blog
        case email
        case followers
        case following
    }
}
