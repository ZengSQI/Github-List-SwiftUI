//
//  ProfileView.swift
//  GithubUserList-SwiftUI
//
//  Created by Steven Zeng on 2021/10/4.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                VStack {
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(height: 300)
                    Spacer()
                }
                KFImage(URL(string: "https://avatars.githubusercontent.com/u/10220437?v=4"))
                    .resizable()
                    .background(Color.white)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.leading, 20)
            }.frame(height: 350)
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.name)
                        .font(.title)
                    Text(viewModel.login)
                        .foregroundColor(.gray)
                        .font(.caption)
                    HStack(spacing: 4) {
                        Image(systemName: "person.2.square.stack.fill")
                        Text(viewModel.followers)
                            .font(.caption)
                        Text("followers・")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text(viewModel.following)
                            .font(.caption)
                        Text("followering・")
                            .foregroundColor(.gray)
                            .font(.caption)

                    }
                    HStack(spacing: 4) {
                        Image(systemName: "envelope.fill")
                        Text(viewModel.email)
                            .font(.caption)
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 32)
        }.onAppear(perform: {
            viewModel.fetchProfile()
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
