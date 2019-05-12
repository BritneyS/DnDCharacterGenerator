//
//  ApolloService.swift
//  DnDCharacterGenerator
//
//  Created by Britney Smith on 5/12/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import Apollo

final class ApolloService {
    
    static let shared = ApolloService()
    
    var client: ApolloClient
    
    init(client: ApolloClient = ApolloClient(url: URL(string: "http://localhost:8000")!)) {
        self.client = client
    }
    
}
