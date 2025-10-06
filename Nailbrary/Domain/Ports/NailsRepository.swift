//
//  NailsRepository.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 16/09/25.
//

import Foundation

public protocol NailsRepository {
    @discardableResult
    func create(photoURL: URL?, caption: String, polishes: [Polish], at date: Date) throws -> NailEntry
    func listAll() -> [NailEntry]                
    func recent(limit: Int) -> [NailEntry] 
}
