//
//  LoginViewModel.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 19/03/2023.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var isLoggedIn = false
    @Published var name: String = ""
    @Published var password: String = ""
    
    private let loginRepository: AuthRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(loginRepository: AuthRepositoryProtocol = AuthRepository(client: AuthNetworkClient())) {
        self.loginRepository = loginRepository
    }
    
    func login() {
        loginRepository.login(username: name, password: password)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print(error)
                case .finished: break
                }
            } receiveValue: { user in
                DispatchQueue.main.async {
                    self.isLoggedIn = true
//                    UserDefaults.standard.setValue(user?.token, forKey: "userToken")
                }
            }
            .store(in: &cancellables)
    }
}
