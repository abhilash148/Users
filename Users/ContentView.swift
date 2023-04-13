//
//  ContentView.swift
//  Users
//
//  Created by Sai Abhilash Gudavalli on 12/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var users = Users()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users.users, id: \.id) { user in
                    NavigationLink {
                        DetailsView(user: user)
                    } label: {
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("Users")
        }
        .onAppear {
            Task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let decoder = try JSONDecoder().decode([User].self, from: data)
            self.users.users = decoder
        } catch {
            print("Abhilash error: \(error.localizedDescription)")
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
