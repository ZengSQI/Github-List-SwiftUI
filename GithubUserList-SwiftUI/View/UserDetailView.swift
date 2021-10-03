//
//  UserDetailView.swift
//  GithubUserList-SwiftUI
//
//  Created by Steven Zeng on 2021/10/4.
//

import SwiftUI
import Kingfisher

struct UserDetailView: View {
    let user: User
    @StateObject var viewModel = UserDetailViewModel()

    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 16) {
                KFImage(viewModel.avatarURL)
                    .resizable()
                    .frame(width: 172, height: 172, alignment: .center)
                    .clipShape(Circle())
                Text(viewModel.name)
                Text(viewModel.bio)
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundColor(.gray.opacity(0.5))
            VStack(alignment: .leading, spacing: 28) {
                HStack(spacing: 16) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                    Text(user.login)
                }
                HStack(spacing: 16) {
                    Image(systemName: "location.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                    Text(viewModel.location)
                }
                HStack(spacing: 16) {
                    Image(systemName: "link")
                        .resizable()
                        .frame(width: 32, height: 32)
                    Text(viewModel.blog)
                }
            }
            .frame(
                minWidth: 0,
                maxWidth: 280,
                alignment: .leading
            )
        }.onAppear(perform: {
            viewModel.fetchDetail(login: user.login)
        })
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User(login: "", id: 0, avatarURL: URL(string: "https://avatars.githubusercontent.com/u/10220437?v=4")!, type: ""))
    }
}
