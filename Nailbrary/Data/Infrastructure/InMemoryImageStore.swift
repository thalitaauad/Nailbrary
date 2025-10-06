//
//  InMemoryImageStore.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 19/09/25.
//

import Foundation

final class InMemoryImageStore: ImageStore {
    private var mem: [String: Data] = [:]
    func saveImage(_ data: Data, suggestedName: String) throws -> URL {
        mem[suggestedName] = data
        return URL(fileURLWithPath: "/dev/null/")
    }
}
