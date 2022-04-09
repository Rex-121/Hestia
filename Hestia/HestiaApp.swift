//
//  HestiaApp.swift
//  Hestia
//
//  Created by Tyrant on 2022/4/9.
//

import SwiftUI

@main
struct HestiaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
