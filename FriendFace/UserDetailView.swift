//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Ярослав Грогуль on 07.02.2023.
//

import SwiftUI

let user2 = User(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: true, name: "Hawkins Patel", age: 50, company: "ABC", email: "abc@email.com", address: "256 Union Avenue, Baker, New Mexico, 518", about: "Big beard", registered: "not", tags: ["Homeless4Life", "CryptoFuture", "InvestingScammer", "LouisVuitton", "Prada", "Rolex"], friends: [Friend(id: "test", name: "Test Friend Name")])

struct TagsView: View {
    let tags: [String]
//    let tags = ["Homeless4Life", "CryptoFuture", "InvestingScammer", "LouisVuitton", "Prada", "Rolex"]
    
    var body: some View {
        VStack {
            SectionHeader(title: "Tags: ")
            ScrollView(.horizontal) {
                HStack {
                    ForEach(tags, id: \.self) { tag in
                        Text("#\(tag)")
                            .padding(10)
                            .background(.secondary.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .fontDesign(.monospaced)
                            .foregroundColor(.blue)
                            
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        
    }
}

struct FriendView: View {
    let friends: [Friend]
    
    var body: some View {
        VStack {
            SectionHeader(title: "Friends:")
            ScrollView(.horizontal) {
                HStack {
                    ForEach(friends, id: \.self) { friend in
                        VStack {
                            ZStack {
                                AsyncImage(url: URL(string: "https://xsgames.co/randomusers/avatar.php?g=pixel")) { image in
                                    image
                                            .resizable()
                                            .scaledToFit()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                                    .padding(15)
                            }
                            
                            VStack {
                                Text(friend.name)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                                Spacer()
                            }
                            .frame(height: 70)
                        }                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        
    }
}

struct UserImage: View {
    let user: User
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "https://xsgames.co/randomusers/avatar.php?g=pixel")) { image in
                image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
            
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding()
            
            if user.isActive {
                Circle()
                    .strokeBorder(.white, lineWidth: 3)
                    .frame(width:60, height: 60)
                    .background(Circle().fill(.green))
                    .offset(CGSize(width: 100, height: 100))
            }
        }
    }
}

struct SectionHeader: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
                .font(.title)
            Spacer()
        }
        .padding([.top], 20)
    }
}

struct UserInfo: View {
    let user: User
    
    var body: some View {
        SectionHeader(title: "Info:")
        
        showDetail(image: "person.fill", text: "\(user.age) years old")
        showDetail(image: "case.fill", text: "Works in \(user.company)")
        showDetail(image: "at", text: user.email)
        showDetail(image: "clock.fill", text: "On FriendFace since \(user.registeredYear)")
    }
    
    func showDetail(image: String, text: String) -> some View {
        return HStack {
            Image(systemName: image)
                .font(.title)
                .frame(width: 50)
            Text(text)
                .font(.title3)
            Spacer()
        }
        .padding([.top, .bottom], 5)
    }
}


struct UserDetailView: View {
    let user: User

    
    
    var body: some View {
        ScrollView {
            VStack {
                UserImage(user: user)
                
                Group {
                    Text(user.name)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    
                    Text(user.address)
                    
                    TagsView(tags: user.tags)
                    
                    FriendView(friends: user.friends)
                    
                    UserInfo(user: user)
        
                    SectionHeader(title: "About: ")
                    
                    Text(user.about)
                        .frame(maxWidth: .infinity, alignment: .leading)
    //                    .background(.red)
                        .padding([.top], 10)
                }
                    
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("User details")
        .navigationBarTitleDisplayMode(.inline)
        
        .padding([.horizontal], 10)
    }
    
    
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: user2)
    }
}
