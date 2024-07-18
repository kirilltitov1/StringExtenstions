//
//  File.swift
//  
//
//  Created by Kirill Titov on 30.01.2024.
//

import Foundation
import SwiftUI

postfix operator ~
public postfix func ~ (string: String) -> String {
    if #available(iOS 15, *) {
        return String(localized: "\(string)", comment: "")
    }
    return NSLocalizedString(string, comment: "")
}

// MARK: convenience for SwiftUI
public postfix func ~ (string: String) -> LocalizedStringKey {
    return LocalizedStringKey(string)
}

public postfix func ~ (tuple: (String, String)) -> LocalizedStringKey {
    let (key, tableName) = tuple
    let localizedString = NSLocalizedString(key, tableName: tableName, bundle: .main, value: "", comment: "")
    return LocalizedStringKey(localizedString)
}
