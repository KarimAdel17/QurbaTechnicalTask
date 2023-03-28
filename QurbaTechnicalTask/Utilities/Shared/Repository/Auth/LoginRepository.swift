//
//  LoginRepository.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 22/03/2023.
//

import Foundation
import Combine

protocol AuthRepositoryProtocol {
    
    func login(username: String, password: String) -> AnyPublisher<UserEntity?, Error>
    func storeToken(token: String?)
    func getToken() -> String?
}

final class AuthRepository<N: AuthNetworkProvider>: BaseRepository<N>, AuthRepositoryProtocol {
    
    private var cancellables = Set<AnyCancellable>()
    
    func login(username: String, password: String) -> AnyPublisher<UserEntity?, Error> {
        
        return client.login(username: username, password: password)
            .map { user in
                self.storeToken(token: user?.token)
                return user
            }
            .eraseToAnyPublisher()
    }
    
    func storeToken(token: String?) {
        UserDefaults.standard.setValue(token, forKey: "userToken")
    }
    
    func getToken() -> String? {
        UserDefaults.standard.value(forKey: "userToken") as? String
    }
}
