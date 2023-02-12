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
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [], predicate: nil) var cachedUsers: FetchedResults<CachedUser>
    
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
                    ForEach(cachedUsers, id: \.id) { user in
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
        .toolbar {
            Button {
                try? moc.save()
            } label: {
                Image(systemName: "square.and.arrow.down.on.square.fill")
            }
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
            
            for user in users {
//                let user = User(conte)
                let newUser = CachedUser(context: moc)
                newUser.id = user.id
                newUser.isActive = user.isActive
                newUser.name = user.name
                newUser.age = Int16(user.age)
                newUser.company = user.company
                newUser.email = user.email
                newUser.address = user.address
                newUser.about = user.about
                newUser.registered = user.registered
                newUser.tags = user.tags.joined(separator: ",")
                
                var friends = [CachedFriend]()
                for friend in user.friends {
                    let newUserFriend = CachedFriend(context: moc)
                    newUserFriend.name = friend.name
                    newUserFriend.id = friend.id
                    newUserFriend.user = [newUser]
                    friends.append(newUserFriend)
                }
                newUser.friends = friends
                
                
            }
            
//            try? moc.save()
    
//            self.users = users
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
