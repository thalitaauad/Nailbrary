//
//  Polish.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 16/09/25.
//

import Foundation

public struct Polish: Identifiable, Equatable {
    public let id: UUID
    public var name: String
    public var brand: String?
    public var photoURL: URL?
    public init(id: UUID = .init(), name: String, brand: String? = nil, photoURL: URL? = nil) {
        self.id = id; self.name = name; self.brand = brand; self.photoURL = photoURL
    }
}
