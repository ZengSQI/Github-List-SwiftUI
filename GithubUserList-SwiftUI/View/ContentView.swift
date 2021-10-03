//
//  ContentView.swift
//  GithubUserList-SwiftUI
//
//  Created by Steven Zeng on 2021/10/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                UserListView()
                    .tabItem { Label("User", systemImage: "person.crop.circle.fill") }
                ProfileView()
                    .tabItem { Label("Mine", systemImage: "info.circle.fill") }
            }
            .navigationBarTitle("GitHub", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
