//
//  CreatePolish.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 16/09/25.
//

import Foundation

public struct CreatePolish {
    private let repo: PolishesRepository
    
    public init(repo: PolishesRepository) {
        self.repo = repo
    }
    
    public func callAsFunction(name: String, brand: String?, photoURL: URL?) throws -> Polish {
        try repo.create(name: name, brand: brand, photoURL: photoURL)
    }
}
