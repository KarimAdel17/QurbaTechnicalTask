//
//  LoginRouter.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 20/03/2023.
//

import Foundation
import Alamofire

enum AuthRouter {
    case login(username: String, password: String)
}

extension AuthRouter: NetworkProvider {
    
    var parameters: Parameters? {
        switch self {
        case let .login(username, password):
            return ["username": username, "password": password]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .login:
            return JSONEncoding.default
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "auth/login"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
}
