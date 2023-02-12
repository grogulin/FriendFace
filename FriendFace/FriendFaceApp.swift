//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Ярослав Грогуль on 07.02.2023.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
