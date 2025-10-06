//
//  ImageStore.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 16/09/25.
//

import Foundation

public protocol ImageStore {
    func saveImage(_ data: Data, suggestedName: String) throws -> URL
}
