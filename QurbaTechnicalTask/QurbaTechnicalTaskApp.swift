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
    
    @StateObject private var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coordinator)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
