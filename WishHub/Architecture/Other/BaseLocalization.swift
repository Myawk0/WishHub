//
//  BaseLocalization.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import Foundation

class BaseLocalization: NSObject {
    func localize(_ id: String) -> String { id.localize(className) }
}
