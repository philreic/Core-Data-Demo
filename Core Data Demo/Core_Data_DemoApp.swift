//
//  Core_Data_DemoApp.swift
//  Core Data Demo
//
//  Created by Philippe Reichen on 12/8/21.
//

import SwiftUI

@main
struct Core_Data_DemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
