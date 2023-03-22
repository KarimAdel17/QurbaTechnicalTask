//
//  NetworkProvider.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 20/03/2023.
//

import Foundation
import Alamofire

protocol NetworkProvider {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    var interceptor: RequestInterceptor? { get }
}

extension NetworkProvider {
    var baseURL: URL {
        URL(string: "https://dummyjson.com/")!
    }
    
    var headers: HTTPHeaders? {
        var headers = HTTPHeaders()
        headers["Content-Type"] = "application/json"
        return headers
    }
    
    var parameters: Parameters? {
        nil
    }
    
    var encoding: ParameterEncoding {
        URLEncoding.default
    }
    
    var interceptor: RequestInterceptor? {
        nil
    }
}
