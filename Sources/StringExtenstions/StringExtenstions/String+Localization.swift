//
//  File.swift
//  
//
//  Created by Kirill Titov on 30.01.2024.
//

import Foundation

postfix operator ~
public postfix func ~ (string: String) -> String {
    if #available(iOS 15, *) {
        return String(localized: "\(string)", comment: "")
    }
    return NSLocalizedString(string, comment: "")
}
