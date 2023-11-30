//
//  ContentView.swift
//  NowWhat
//
//  Created by Karsten Westra on 02/06/2023.
//

import SwiftUI

class API: ObservableObject {

  func loadUserProfile() {
    let username = Bundle.main.object(forInfoDictionaryKey: "GITHUB_USERNAME") as? String ?? ""

    Task {
      // User Info
      let url = URL(string: "https://api.github.com/users/\(username)")!
      let (profileData, _) = try await URLSession.shared.data(from: url)
      if let profile = String(data: profileData, encoding: .utf8) {
        DispatchQueue.main.async {
          print("profile = \(profile)")
        }
      }

      // User repos; this should be retrieved from `repos_url` obtained in previous users call.
      let repoUrl = URL(string: "https://api.github.com/users/\(username)/repos")!
      let (repoData, _) = try await URLSession.shared.data(from: repoUrl)
      if let repos = String(data: repoData, encoding: .utf8) {
        DispatchQueue.main.async {
          print("repos = \(repos)")
        }
      }
    }
  }
}

struct ContentView: View {

  @StateObject var vm = API()

  var body: some View {
    VStack {
      Image(systemName: "list.bullet.indent")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("So, now what!?")
      Text(Bundle.main.object(forInfoDictionaryKey: "GITHUB_USERNAME") as? String ?? "")
    }
    .onAppear {
      vm.loadUserProfile()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
