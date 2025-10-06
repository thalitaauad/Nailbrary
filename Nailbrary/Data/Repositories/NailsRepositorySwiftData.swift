//
//  NailsRepositorySwiftData.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 18/09/25.
//

import SwiftData
import Foundation

final class NailsRepositorySwiftData: NailsRepository {
    private let ctx: ModelContext
    init(context: ModelContext) { self.ctx = context }
    
    func create(photoURL: URL?, caption: String, polishes: [Polish], at date: Date) throws -> NailEntry {
        let all = (try? ctx.fetch(FetchDescriptor<PolishModel>())) ?? []
        let idset = Set(polishes.map { $0.id })
        let linked = all.filter { idset.contains($0.id) }
        let model = NailEntryModel(createdAt: date, photoPath: photoURL?.path, caption: caption, polishes: linked)
        ctx.insert(model)
        try ctx.save()
        return NailEntryMapper.toEntity(model)
    }
    
    func listAll() -> [NailEntry] {
           var desc = FetchDescriptor<NailEntryModel>()
           desc.sortBy = [ .init(\.createdAt, order: .reverse) ]
           let rows = (try? ctx.fetch(desc)) ?? []
           return rows.map(NailEntryMapper.toEntity)
       }

    func recent(limit: Int) -> [NailEntry] {
        var desc = FetchDescriptor<NailEntryModel>()
        desc.sortBy = [ .init(\.createdAt, order: .reverse) ]
        desc.fetchLimit = limit
        let rows = (try? ctx.fetch(desc)) ?? []
        return rows.map(NailEntryMapper.toEntity)
    }
}
