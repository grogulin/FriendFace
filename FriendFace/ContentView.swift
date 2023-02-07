//
//  ContentView.swift
//  FriendFace
//
//  Created by Ярослав Грогуль on 07.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    @State private var showingAsList = false
    
    var columns: [GridItem] {
        [
            GridItem(.adaptive(minimum: showingAsList ? .infinity : 100))
        ]
    }
    
    var body: some View {
        NavigationView {
//            List {
//                ForEach(users, id: \.id) { user in
//                    Text(user.name)
//                }
//            }
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(users, id: \.id) { user in
                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            UserView(user: user)
                        }
                        
                    }
                }
                .task {
                    await loadData()
                }
                .padding()
            }
            .navigationTitle("FriendFace")
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let users = try? JSONDecoder().decode([User].self, from: data) else {
                print("Can't decode from uncoded string")
                return
            }
    
            self.users = users
        } catch {
            print("Invalid data")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
