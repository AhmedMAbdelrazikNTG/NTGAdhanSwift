//
//  File.swift
//  Adhan
//
//  Created by Amin on 29/09/2025.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, tableName: nil, bundle: .module, value: "", comment: "")
    }
}
