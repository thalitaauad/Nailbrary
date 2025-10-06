//
//  LocalImageStore.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 19/09/25.
//

import Foundation

final class LocalImageStore: ImageStore {
    func saveImage(_ data: Data, suggestedName: String) throws -> URL {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let url = dir.appendingPathComponent("\(UUID().uuidString)_\(suggestedName).jpg")
        try data.write(to: url, options: .atomic)
        return url
    }
}
