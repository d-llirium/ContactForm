//
//  ContentView.swift
//  Contact Form
//
//  Created by User on 05/10/23.
//

import SwiftUI

struct ContentView: View {
    
    enum ContactMethod {
        case email, phone
    }
    @State private var preferredContactMethod = ContactMethod.email
    @State private var emailAddress = ""
    @State private var phoneNumber = ""
    
    @State private var subject = "Help"
    
    @State private var message = "Write your message here..."
    
    @State private var includeLogs = false
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Contact Method",
                           selection: $preferredContactMethod) {
                        Text("Email").tag(ContactMethod.email)
                        Text("Phone").tag(ContactMethod.phone)
                    }
                           .pickerStyle(SegmentedPickerStyle())
                    switch preferredContactMethod {
                    case .email:
                        TextField("Email Address",
                                  text: $emailAddress
                        )
                    case .phone:
                        TextField("Phone Number",
                                  text: $phoneNumber
                        )
                    }
                } header: {
                    Text("How can we reach you?")
                }
                Section {
                    Picker("Subject", //NavigationLink
                           selection: $subject) {
                        ForEach(["Help", "Sugestion", "Bug Report"],
                                id: \.self) { subject in
                            Text(subject)
                        }
                    }
                } header: {
                    Text("What can we help you with?")
                }
                Section {
                    TextEditor(text: $message)
                } header: {
                    Text("Briefly explain what's going on.")
                }
                Section {
                    Toggle("Include Logs",
                           isOn: $includeLogs
                    )
                } footer: {
                    Text("This information will be sent anonymously.")
                }
                Button("Submit") {
                    print("Submit button tapped")
                }
            }
            .navigationTitle("Contact Us")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
