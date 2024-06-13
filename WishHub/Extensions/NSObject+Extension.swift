//
//  NSObject+Extension.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import Foundation

extension NSObject {
    var className: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }

    class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
