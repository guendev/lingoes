//
//  lingoesApp.swift
//  lingoes
//
//  Created by Guen on 01/09/2023.
//

import SwiftUI

@main
struct lingoesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
