//
//  User.swift
//  FriendFace
//
//  Created by Ярослав Грогуль on 07.02.2023.
//

import Foundation

//class Users: Codable {
//    @Published var users = User()
//}

struct Users: Codable {
    var results: [User]
}

struct User: Codable, Hashable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    var registeredDate: Date {
        do {
            return try Date(registered, strategy: .iso8601)
        } catch {
            return Date.now
        }
    }
    var registeredYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.string(from: registeredDate)
    }
    let tags: [String]
    let friends: [Friend]
    
//    init() { }
}
