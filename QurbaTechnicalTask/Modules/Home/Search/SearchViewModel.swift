//
//  SearchViewModel.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 22/03/2023.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    @Published var search: String = ""
    
    private let repository: HomeRepositoryProtocol
    @Published var posts = [Post]()
    private var cancellables = Set<AnyCancellable>()
    
    init(repository: HomeRepositoryProtocol = HomeRepository(client: HomeNetworkClient())) {
        self.repository = repository
    }
    
    func getSearchResultsData() {
        
        repository.getSearchResults(search: search)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print(error)
                case .finished: break
                }
            } receiveValue: { posts in
                self.posts = posts ?? []
            }
            .store(in: &cancellables)
    }
}
