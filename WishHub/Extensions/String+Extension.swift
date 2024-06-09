//
//  String+Extension.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import Foundation

extension String {
    var localize: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var localizeError: String {
        return NSLocalizedString(self, tableName: "ErrorLocalizable", comment: "")
    }
    
    func localize(_ table: String = "") -> String {
        return NSLocalizedString(self, tableName: table, comment: "")
    }
}
