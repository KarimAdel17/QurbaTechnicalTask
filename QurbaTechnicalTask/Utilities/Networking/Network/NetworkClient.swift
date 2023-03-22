//
//  NetworkClient.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 20/03/2023.
//

import Foundation
import Combine
import Alamofire

protocol NetworkClient {
    func fetch<T>(endpoint: NetworkProvider, type: T.Type) -> AnyPublisher<T, Error> where T: Decodable
}

extension NetworkClient {
    
    func fetch<T>(endpoint: NetworkProvider, type: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
        
        return AF.request(endpoint.baseURL.appendingPathComponent(endpoint.path), method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.encoding, headers: endpoint.headers).publishData()
            .tryMap({ response -> Data in
                switch response.result {
                case .success(let data):
                    return data
                case .failure(let error):
                    throw error
                }
        })
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
