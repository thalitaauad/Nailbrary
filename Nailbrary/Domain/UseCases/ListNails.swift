//
//  ListNails.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 16/09/25.
//

import Foundation

public struct ListNails {
    private let repo: NailsRepository
    
    public init(repo: NailsRepository) {
        self.repo = repo
    }
    
    public func callAsFunction() -> [NailEntry] {
        repo.listAll()
    }
    
    public func recent(_ limit: Int) -> [NailEntry] {
        repo.recent(limit: limit)
    }
}
