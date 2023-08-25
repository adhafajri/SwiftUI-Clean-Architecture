//
//  Pokemon_Clean_ArchitectureApp.swift
//  Pokemon Clean Architecture
//
//  Created by Muhammad Adha Fajri Jonison on 25/08/23.
//

import SwiftUI

@main
struct Pokemon_Clean_ArchitectureApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
