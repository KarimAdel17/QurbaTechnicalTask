//
//  LoginModel.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 20/03/2023.
//

import Foundation

struct UserEntity: Codable {
    let id: Int?
    let username, email, firstName, lastName: String?
    let gender: String?
    let image: String?
    let token: String?
}
