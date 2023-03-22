//
//  FeedRouter.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 22/03/2023.
//

import Foundation
import Alamofire

enum HomeRouter {
    case feedData
    case searchResults(search: String)
}

extension HomeRouter: NetworkProvider {
    
    var path: String {
        switch self {
        case .feedData:
            return "posts"
        case let .searchResults(search):
            return "posts/search?q=\(search)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .feedData, .searchResults:
            return .get
        }
    }
}
