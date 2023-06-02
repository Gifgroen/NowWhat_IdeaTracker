//
//  ContentView.swift
//  NowWhat
//
//  Created by Karsten Westra on 02/06/2023.
//

import SwiftUI

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
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
