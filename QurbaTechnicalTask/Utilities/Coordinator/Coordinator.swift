//
//  Coordinator.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 21/03/2023.
//

import SwiftUI

enum Page: String, Identifiable {
    case login, feed, search, tapBar
    
    var id: String {
        self.rawValue
    }
}

class AppCoordinator: ObservableObject {
    
//    @Published var isLoggedIn: Bool = false
    @Published var path = NavigationPath()
    
    func root(_ page: Page) {
        path.removeLast(path.count)
        path.append(page)
    }

    func push(_ page: Page) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .login:
            LoginView()
        case .feed:
            FeedView()
        case .search:
            SearchView()
        case .tapBar:
            TabBar()
        }
    }
}
