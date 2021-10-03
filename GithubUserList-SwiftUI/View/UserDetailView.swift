//
//  UserDetailView.swift
//  GithubUserList-SwiftUI
//
//  Created by Steven Zeng on 2021/10/4.
//

import SwiftUI
import Kingfisher

struct UserDetailView: View {

    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 16) {
                KFImage(URL(string: "https://avatars.githubusercontent.com/u/10220437?v=4"))
                    .resizable()
                    .frame(width: 172, height: 172, alignment: .center)
                    .clipShape(Circle())
                Text("Name")
                Text("Bio")
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
                    Text("login")
                }
                HStack(spacing: 16) {
                    Image(systemName: "location.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                    Text("location")
                }
                HStack(spacing: 16) {
                    Image(systemName: "link")
                        .resizable()
                        .frame(width: 32, height: 32)
                    Text("blog")
                }
            }
            .frame(
                minWidth: 0,
                maxWidth: 280,
                alignment: .leading
            )
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
    }
}
