//
//  PolishesRepositorySwiftData.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 18/09/25.
//

import SwiftData
import Foundation

final class PolishesRepositorySwiftData: PolishesRepository {
    private let ctx: ModelContext
    init(context: ModelContext) { self.ctx = context }
    
    
    func create(name: String, brand: String?, photoURL: URL?) throws -> Polish {
        let model = PolishModel(name: name, brand: brand, photoPath: photoURL?.path)
        ctx.insert(model)
        try ctx.save()
        return PolishMapper.toEntity(model)
    }
    
    func listAll() -> [Polish] {
        (try? ctx.fetch(FetchDescriptor<PolishModel>()))?.map(PolishMapper.toEntity) ?? []
    }
    
    func search(byName q: String) -> [Polish] {
        if q.isEmpty { return listAll() }
        let pred = #Predicate<PolishModel> { $0.name.localizedStandardContains(q)}
        let desc = FetchDescriptor<PolishModel>(predicate: pred)
        return (try? ctx.fetch(desc))?.map(PolishMapper.toEntity) ?? []
    }
}
