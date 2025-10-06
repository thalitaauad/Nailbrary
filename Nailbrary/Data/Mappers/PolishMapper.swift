//
//  PolishMapper.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 18/09/25.
//

import Foundation

enum PolishMapper {
    static func toEntity(_ m: PolishModel) -> Polish {
        .init(id: m.id, name: m.name, brand: m.brand, photoURL: m.photoPath.map(URL.init(fileURLWithPath:)))
    }
}
