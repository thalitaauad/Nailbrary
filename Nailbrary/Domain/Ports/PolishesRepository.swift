//
//  PolishesRepository.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 16/09/25.
//

import Foundation

public protocol PolishesRepository {
    @discardableResult
    func create(name: String, brand: String?, photoURL: URL?) throws -> Polish
    func listAll() -> [Polish]
    func search(byName query: String) -> [Polish]
}
