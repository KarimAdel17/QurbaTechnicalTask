//
//  FeedRepository.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 22/03/2023.
//

import Foundation
import Combine

protocol HomeRepositoryProtocol {
    
    func getFeedData() -> AnyPublisher<[Post]?, Error>
    func getSearchResults(search: String) -> AnyPublisher<[Post]?, Error>
}

final class HomeRepository<N: HomeNetworkProvider>: BaseRepository<N>, HomeRepositoryProtocol {
    
    private var cancellables = Set<AnyCancellable>()
    
    func getFeedData() -> AnyPublisher<[Post]?, Error> {
        
        return client.getFeedData()
            .map { posts in
                return posts?.posts
            }
            .eraseToAnyPublisher()
    }
    
    func getSearchResults(search: String) -> AnyPublisher<[Post]?, Error> {
        return client.getSearchResults(search: search)
            .map { posts in
                return posts?.posts
            }
            .eraseToAnyPublisher()
    }
}
