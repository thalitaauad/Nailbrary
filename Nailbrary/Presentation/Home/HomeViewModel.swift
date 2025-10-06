//
//  HomeViewModel.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 15/09/25.
//

import Foundation
internal import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var title = "Welcome to your Nailbrary"
    @Published var nails: [NailEntry] = []

    let env: AppEnvironment
    init(env: AppEnvironment) { self.env = env }

    func reload() {
        nails = ListNails(repo: env.nailsRepo).recent(20) 
    }
}
