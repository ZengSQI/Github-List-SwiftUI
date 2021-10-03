//
//  Github.swift
//  GithubUserList-SwiftUI
//
//  Created by Steven Zeng on 2021/10/4.
//

import Foundation
import Moya

enum Github {
    case userList(since: Int, pageSize: Int)
    case userDetail(login: String)
    case selfDetail
}

extension Github: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    var path: String {
        switch self {
        case .userList:
            return "/users"
        case .userDetail(login: let login):
            return "/users/\(login)"
        case .selfDetail:
            return "/user"
        }
    }

    var method: Moya.Method {
        switch self {
        case .userList, .userDetail, .selfDetail:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .userList(since: let since, pageSize: let pageSize):
            return .requestParameters(parameters: [ "since": since, "per_page": pageSize ], encoding: URLEncoding.default)
        case .userDetail, .selfDetail:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return ["Authorization": "token <#TOKEN#>"]
    }
}
