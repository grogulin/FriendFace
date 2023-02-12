//
//  UserView.swift
//  FriendFace
//
//  Created by Ярослав Грогуль on 07.02.2023.
//

import Foundation
import SwiftUI

let user = User(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: true, name: "Test name", age: 50, company: "ABC", email: "abc@email.com", address: "homeless", about: "Big beard", registered: "not", tags: ["Homeless4Life", "CryptoFuture", "InvestingScammer", "LouisVuitton", "Prada", "Rolex"], friends: [Friend(id: "test", name: "Test Friend Name")])

struct UserView: View {
    
//    let user: User
    let user: CachedUser
    
    var body: some View {
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
                
                if user.isActive {
                    Circle()
                        .strokeBorder(.white, lineWidth: 3)
                        .frame(width:30, height: 30)
                        .background(Circle().fill(.green))
                        .offset(CGSize(width: 30, height: 30))
                }
            }
            
            VStack {
                Text(user.wrappedName)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .frame(height: 70)
        }
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView(user: user)
//    }
//}

