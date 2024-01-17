//
//  ContentView.swift
//  NowWhat
//
//  Created by Karsten Westra on 02/06/2023.
//

import SwiftUI

struct SettingsScreen: View {
  @State private var isNotificationEnabled = false
  @State private var firstName = ""
  @State private var lastName = ""
  @State private var email = ""
  @State private var githubUsername = ""

  var body: some View {
    VStack {
      TextField("First Name", text: $firstName)
        .textFieldStyle(RoundedBorderTextFieldStyle())

      TextField("Last Name", text: $lastName)
        .textFieldStyle(RoundedBorderTextFieldStyle())

      TextField("Email", text: $email)
        .textFieldStyle(RoundedBorderTextFieldStyle())

      TextField("GitHub Username", text: $githubUsername)
        .textFieldStyle(RoundedBorderTextFieldStyle())

      Toggle("Enable Notifications", isOn: $isNotificationEnabled)
      // Add more settings here
      


      Button("Save") {
        // Save settings
      }

    }
    .onAppear {
        firstName = Bundle.main.object(forInfoDictionaryKey: "GITHUB_USERNAME") as? String ?? ""
    }
  }
}

struct ContentView: View {
  var body: some View {
    NavigationView {
      VStack {
        Image(systemName: "list.bullet.indent")
          .imageScale(.large)
          .foregroundColor(.accentColor)
        Text("So, now what!?")
          .padding(16)

        NavigationLink(destination: SettingsScreen()) {
          Text("Settings")
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
