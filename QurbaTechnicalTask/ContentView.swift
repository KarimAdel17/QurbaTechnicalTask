//
//  ContentView.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 16/03/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        
        CoordinatorView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
