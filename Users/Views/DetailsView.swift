//
//  DetailsView.swift
//  Users
//
//  Created by Sai Abhilash Gudavalli on 13/04/23.
//

import SwiftUI

struct DetailsView: View {
    var user: User
    var body: some View {
        List {
            Section {
                Text(user.company)
                Text(user.email)
            } header: {
                Text("Personal Information")
            }
            
            Section("Friends", content: {
                
                ForEach(user.friends, id:\.id) { friend in
                    Text(friend.name)
                }
            })
            
            .navigationTitle(user.name)
        }
    }
    
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(user: User(id: "", isActive: true, name: "", age: 0, company: "", email: "", address: "", about: "", friends: []))
    }
}
