//
//  DateFormatter.swift
//  PopFoods
//
//  Created by Kirill Titov on 09.02.2024.
//

import Foundation

public extension DateFormatter {
    var ru: Self {
        locale = Locale(identifier: "ru_RU")
        return self
    }
}
