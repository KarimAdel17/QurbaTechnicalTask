//
//  BaseRepository.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 22/03/2023.
//

import Foundation

class BaseRepository<Network: NetworkClient> {
    var client: Network
    required init(client: Network) {
        self.client = client
    }
}
