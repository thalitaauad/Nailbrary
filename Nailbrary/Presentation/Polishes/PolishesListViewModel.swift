//
//  PolishesListViewModel.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 15/09/25.
//

import Foundation
internal import Combine

@MainActor
final class PolishesListViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var polishes: [Polish] = []
    @Published var selected: Set<UUID> = []
    
    
    let env: AppEnvironment
    let selectionMode: Bool
    let onSelect: (([Polish]) -> Void)?
    
    
    init(env: AppEnvironment, selectionMode: Bool = false, onSelect: (([Polish]) -> Void)? = nil) {
        self.env = env; self.selectionMode = selectionMode; self.onSelect = onSelect
        reload()
    }
    
    func reload() {
        polishes = ListPolishes(repo: env.polishesRepo)()
    }
    
    func search(_ q: String) {
        polishes = q.isEmpty ? ListPolishes(repo: env.polishesRepo)() : SearchPolishes(repo: env.polishesRepo)(q)
    }
    
    func toggle(_ p: Polish) {
        if selected.contains(p.id) {
            selected.remove(p.id)
        } else {
            selected.insert(p.id)
        }
    }
    
    func confirm() {
        guard selectionMode else {
            return
        }; onSelect?(polishes.filter{
            selected.contains($0.id)
        })
    }
}
