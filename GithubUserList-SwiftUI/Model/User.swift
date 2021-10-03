//
//  User.swift
//  GithubUserList-SwiftUI
//
//  Created by Steven Zeng on 2021/10/3.
//

import Foundation

struct User: Codable, Equatable, Identifiable {
  let login: String
  let id: Int
  let avatarURL: URL
  let type: String

  enum CodingKeys: String, CodingKey {
    case login
    case id
    case avatarURL = "avatar_url"
    case type
  }
}
