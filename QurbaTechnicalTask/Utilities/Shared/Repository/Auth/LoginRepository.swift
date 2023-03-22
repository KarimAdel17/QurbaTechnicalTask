//
//  LoginRepository.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 22/03/2023.
//

import Foundation
import Combine

protocol LoginRepositoryProtocol {
    
    func login(username: String, password: String) -> AnyPublisher<UserEntity?, Error>
    func storeToken(token: String?)
    func getToken() -> String?
}

final class LoginRepository<N: AuthNetworkProvider>: BaseRepository<N>, LoginRepositoryProtocol {
    
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
