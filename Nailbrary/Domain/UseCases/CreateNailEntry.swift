//
//  CreateNailEntry.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 16/09/25.
//

import Foundation

public struct CreateNailEntry {
    private let nails: NailsRepository
    private let date: DateProvider
    
    public init(nails: NailsRepository, date: DateProvider) {
        self.nails = nails; self.date = date
    }
    
    public func callAsFunction(photoURL: URL?, caption: String, polishes: [Polish]) throws -> NailEntry {
        try nails.create(photoURL: photoURL, caption: caption, polishes: polishes, at: date.now())
    }
}
