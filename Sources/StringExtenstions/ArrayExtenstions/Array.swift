//
//  Array.swift
//  PopFoods
//
//  Created by Kirill Titov on 09.02.2024.
//

import Foundation

public extension Array {
    func splitIntoChunks(chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, count)])
        }
    }
}
