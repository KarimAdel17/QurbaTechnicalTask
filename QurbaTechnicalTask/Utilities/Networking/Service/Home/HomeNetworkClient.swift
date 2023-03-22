//
//  HomeNetworkClient.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 22/03/2023.
//

import Foundation
import Combine

protocol HomeNetworkProvider: NetworkClient {
    func getFeedData() -> AnyPublisher<PostsModel?, Error>
    func getSearchResults(search: String) -> AnyPublisher<PostsModel?, Error>
}

struct HomeNetworkClient: HomeNetworkProvider {
    func getFeedData() -> AnyPublisher<PostsModel?, Error> {
        return fetch(endpoint: HomeRouter.feedData, type: PostsModel?.self)
    }
    
    func getSearchResults(search: String) -> AnyPublisher<PostsModel?, Error> {
        return fetch(endpoint: HomeRouter.searchResults(search: search), type: PostsModel?.self)
    }
}
