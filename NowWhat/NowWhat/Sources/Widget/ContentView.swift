//
//  ContentView.swift
//  NowWhat
//
//  Created by Karsten Westra on 02/06/2023.
//

import SwiftUI

class API: ObservableObject {

  @Published var json: String = ""

  func loadUserProfile() {
    let username = Bundle.main.object(forInfoDictionaryKey: "GITHUB_USERNAME") as? String ?? ""
    let url = URL(string: "https://api.github.com/users/\(username)")!

    Task {
      let (data, _) = try await URLSession.shared.data(from: url)
      if let string = String(data: data, encoding: .utf8) {
        DispatchQueue.main.async { [weak self] in
          self?.json = string
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
      Text(vm.json)
    }
    .padding()
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
