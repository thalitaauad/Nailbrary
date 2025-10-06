//
//  DateProvider.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 16/09/25.
//

import Foundation

public protocol DateProvider {
    func now() -> Date
}

public struct SystemDateProvider: DateProvider {
    public func now() -> Date { Date()}
}
