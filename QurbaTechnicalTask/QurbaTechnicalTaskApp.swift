//
//  QurbaTechnicalTaskApp.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 16/03/2023.
//

import SwiftUI

@main
struct QurbaTechnicalTaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
