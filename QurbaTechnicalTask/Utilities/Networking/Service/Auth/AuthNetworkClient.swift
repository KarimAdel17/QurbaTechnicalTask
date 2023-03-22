//
//  LoginNetworkClient.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 20/03/2023.
//

import Foundation
import Combine

protocol AuthNetworkProvider: NetworkClient {
    func login(username: String, password: String) -> AnyPublisher<UserEntity?, Error>
}

struct AuthNetworkClient: AuthNetworkProvider {
    func login(username: String, password: String) -> AnyPublisher<UserEntity?, Error> {
        return fetch(endpoint: AuthRouter.login(username: username, password: password), type: UserEntity?.self)
    }
}
