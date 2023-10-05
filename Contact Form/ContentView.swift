//
//  ContentView.swift
//  Contact Form
//
//  Created by User on 05/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var emailAddress = ""
    @State private var message = "Write your message here..."
    @State private var includeLogs = false
    var body: some View {
        Form {
            TextField("Email Address", // placeholder
                      text: $emailAddress // binding to @State emailAddress
            )
            TextEditor(text: $message)
            Toggle("Include Logs",
                   isOn: $includeLogs
            )
            Button("Submit") {
                print("Submit button tapped")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
