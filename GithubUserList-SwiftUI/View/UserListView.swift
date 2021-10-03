//
//  UserListView.swift
//  GithubUserList-SwiftUI
//
//  Created by Steven Zeng on 2021/10/4.
//

import SwiftUI
import Kingfisher

struct UserListView: View {

    var users: [User] = [
        User(login: "login_name_A", id: 1, avatarURL: URL(string: "https://avatars.githubusercontent.com/u/10220437?v=4")!, type: "User"),
        User(login: "login_name_B", id: 2, avatarURL: URL(string: "https://avatars.githubusercontent.com/u/10220437?v=4")!, type: "User"),
        User(login: "login_name_C", id: 3, avatarURL: URL(string: "https://avatars.githubusercontent.com/u/10220437?v=4")!, type: "User"),
        User(login: "login_name_D", id: 4, avatarURL: URL(string: "https://avatars.githubusercontent.com/u/10220437?v=4")!, type: "User"),
    ]

    var body: some View {
        List {
            ForEach (users) { user in
                UserCell(
                    avatarURL: user.avatarURL,
                    userLogin: user.login,
                    userType: user.type
                )
            }
        }
    }
}

struct UserCell: View {
    let avatarURL: URL?
    let userLogin: String
    let userType: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center, spacing: 16) {
                KFImage(avatarURL)
                    .resizable()
                    .frame(width: 48, height: 48, alignment: .center)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    Text(userLogin)
                    Text(userType)
                        .foregroundColor(.gray)
                        .font(.system(.caption))
                }
            }.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: 72,
            alignment: .leading
        )
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserCell(avatarURL: URL(string: "https://avatars.githubusercontent.com/u/10220437?v=4"), userLogin: "login_name", userType: "User")
                .previewLayout(.sizeThatFits)
            UserListView()
        }
    }
}
