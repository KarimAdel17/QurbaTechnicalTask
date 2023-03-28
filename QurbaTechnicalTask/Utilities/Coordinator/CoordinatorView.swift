//
//  CoordinatorView.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 21/03/2023.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = AppCoordinator()
    private let repository: AuthRepositoryProtocol
    
    init(repository: AuthRepositoryProtocol = AuthRepository(client: AuthNetworkClient())) {
        self.repository = repository
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            
            if (repository.getToken() != nil) {
                coordinator.build(page: .tapBar)
                    .navigationDestination(for: Page.self) { page in
                        coordinator.build(page: page)
                    }
                    .navigationBarBackButtonHidden(true)
                    .sheet(item: $coordinator.sheet) { sheet in
                        coordinator.build(sheet: sheet)
                    }
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
