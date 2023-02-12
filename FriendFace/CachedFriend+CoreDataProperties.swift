//
//  CachedFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Ярослав Грогуль on 08.02.2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    public var wrappedId: String {
        id ?? "unknown id"
    }
    
    @NSManaged public var name: String?
    public var wrappedName: String {
        name ?? "unknown name"
    }
    
    @NSManaged public var user: [CachedUser]?

}

// MARK: Generated accessors for user
extension CachedFriend {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: CachedUser)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: CachedUser)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}

extension CachedFriend : Identifiable {

}
