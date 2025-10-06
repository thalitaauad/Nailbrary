//
//  ListPolishes.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 16/09/25.
//

import Foundation

public struct ListPolishes {
    private let repo: PolishesRepository
    
    public init(repo: PolishesRepository) {
        self.repo = repo
    }
    
    public func callAsFunction() -> [Polish] {
        repo.listAll()
    }
}
