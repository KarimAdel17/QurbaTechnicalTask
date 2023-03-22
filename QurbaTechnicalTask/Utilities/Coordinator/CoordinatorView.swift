//
//  CoordinatorView.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 21/03/2023.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            
            if (UserDefaults.standard.value(forKey: "userToken") != nil) {
                coordinator.build(page: .tapBar)
                    .navigationDestination(for: Page.self) { page in
                        coordinator.build(page: page)
                    }
                    .navigationBarBackButtonHidden(true)
            } else {
                LoginView()
            }
        }
        .environmentObject(coordinator)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
