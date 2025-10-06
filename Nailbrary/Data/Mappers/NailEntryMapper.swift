//
//  NailEntryMapper.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 18/09/25.
//

import Foundation

enum NailEntryMapper {
    static func toEntity(_ m: NailEntryModel) -> NailEntry {
        .init(id: m.id, createdAt: m.createdAt, photoURL: m.photoPath.map(URL.init(fileURLWithPath:)), caption: m.caption, polishes: m.polishes.map(PolishMapper.toEntity))
    }
}
