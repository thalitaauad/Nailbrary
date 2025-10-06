//
//  NailbraryApp.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 15/09/25.
//

import SwiftUI
import SwiftData

@main
struct NailbraryApp: App {
    var body: some Scene {
        WindowGroup {
            let container = try! ModelContainer(for: PolishModel.self, NailEntryModel.self)
            let ctx = ModelContext(container)
            let env = AppEnvironment(
                nailsRepo: NailsRepositorySwiftData(context: ctx),
                polishesRepo: PolishesRepositorySwiftData(context: ctx),
                imageStore: LocalImageStore(),
                dateProvider: SystemDateProvider()
            )
            HomeView(vm: .init(env: env))
                .modelContainer(container)
        }
    }
}
