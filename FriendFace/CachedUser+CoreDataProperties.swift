//
//  CachedUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Ярослав Грогуль on 08.02.2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    public var wrappedAbout: String {
        about ?? "no about"
    }
    
    @NSManaged public var address: String?
    public var wrappedAddress: String {
        address ?? "no address"
    }
    
    @NSManaged public var age: Int16
    public var wrappedAge: Int16 {
        age ?? 0
    }
    
    @NSManaged public var company: String?
    public var wrappedCompany: String {
        company ?? "unknown company"
    }
    
    @NSManaged public var email: String?
    public var wrappedEmail: String {
        email ?? "unknown email"
    }
    
    @NSManaged public var id: String?
    public var wrappedId: String {
        id ?? "no id"
    }
    
    @NSManaged public var isActive: Bool
    public var wrappedIsActive: Bool {
        isActive ?? false
    }
    
    @NSManaged public var name: String?
    public var wrappedName: String {
        name ?? "unknown name"
    }
    
    @NSManaged public var registered: String?
    public var wrappedRegistered: String {
        registered ?? "1970-01-01T01:00:00-00:00"
    }
    
    @NSManaged public var tags: String?
    public var wrappedTags: String {
        tags ?? "test, test2"
    }
    
//    @NSManaged public var friends: NSSet?
    @NSManaged public var friends: [CachedFriend]

}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
