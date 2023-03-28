//
//  Coordinator.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 21/03/2023.
//

import SwiftUI

enum Page: String, Identifiable {
    case login, tapBar, search
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case image
    
    var id: String {
        self.rawValue
    }
}

class AppCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    
    func root(_ page: Page) {
        path.removeLast(path.count)
        path.append(page)
    }

    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(_ sheet: Sheet) {
        self.sheet = sheet
    }

    func pop() {
        path.removeLast()
    }

    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .login:
            LoginView()
        case .tapBar:
            TabBar()
        case .search:
            SearchView()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .image:
            ImagePreviewView(image: "three-girl-friends-having-pizza-bar 1")
        }
    }
}
