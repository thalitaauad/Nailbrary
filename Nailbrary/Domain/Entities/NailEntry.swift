//
//  NailEntry.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 16/09/25.
//

import Foundation

public struct NailEntry: Identifiable, Equatable {
    public let id: UUID
    public var createdAt: Date
    public var photoURL: URL?
    public var caption: String
    public var polishes: [Polish]
    public init(id: UUID = .init(), createdAt: Date, photoURL: URL? = nil, caption: String, polishes: [Polish]) {
        self.id = id; self.createdAt = createdAt; self.photoURL = photoURL; self.caption = caption; self.polishes = polishes
    }
}
