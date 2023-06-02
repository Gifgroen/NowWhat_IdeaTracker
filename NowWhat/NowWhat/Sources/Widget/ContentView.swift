//
//  ContentView.swift
//  NowWhat
//
//  Created by Karsten Westra on 02/06/2023.
//

import SwiftUI

func loadUserProfile() {
  let username = Bundle.main.object(forInfoDictionaryKey: "GITHUB_USERNAME") as? String ?? ""
  let request = URLRequest(url: URL(string: "https://api.github.com/users/\(username)")!)
  URLSession.shared.dataTask(with: request) { data, response, error in
    guard let data else { return }
    print("data: \(String(describing: String(data: data, encoding: .utf8)))")
  }
  .resume()
}

struct ContentView: View {

  var body: some View {
    VStack {
      Image(systemName: "list.bullet.indent")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("So, now what!?")
      Text(Bundle.main.object(forInfoDictionaryKey: "GITHUB_USERNAME") as? String ?? "")
    }
    .padding()
    .onAppear {
      loadUserProfile()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
