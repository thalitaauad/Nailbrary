//
//  SearchPolishes.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 16/09/25.
//

import Foundation

public struct SearchPolishes {
    private let repo: PolishesRepository
    
    public init(repo: PolishesRepository) {
        self.repo = repo
    }
    
    public func callAsFunction(_ q: String) -> [Polish] {
        repo.search(byName: q)
    }
}
