//
//  NASAAPODApp.swift
//  NASAAPOD
//
//  Created by Arjun on 24/04/26.
//

import SwiftUI
import CoreData

@main
struct NASAAPODApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
