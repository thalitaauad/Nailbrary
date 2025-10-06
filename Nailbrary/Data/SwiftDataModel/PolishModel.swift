//
//  PolishModel.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 18/09/25.
//

import SwiftData
import Foundation

@Model final class PolishModel {
    @Attribute(.unique) var id: UUID
    var name: String
    var brand: String?
    var photoPath: String?
    init(id: UUID = .init(), name: String, brand: String? = nil, photoPath: String? = nil) {
        self.id = id; self.name = name; self.brand = brand; self.photoPath = photoPath
    }
}
