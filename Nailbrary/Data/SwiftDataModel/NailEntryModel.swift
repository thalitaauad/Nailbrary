//
//  NailEntryModel.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 18/09/25.
//

import SwiftData
import Foundation

@Model final class NailEntryModel {
    @Attribute(.unique) var id: UUID
    var createdAt: Date
    var photoPath: String?
    var caption: String
    @Relationship var polishes: [PolishModel]
    init(id: UUID = .init(), createdAt: Date, photoPath: String? = nil, caption: String, polishes: [PolishModel]) {
        self.id = id; self.createdAt = createdAt; self.photoPath = photoPath; self.caption = caption; self.polishes = polishes
    }
}
