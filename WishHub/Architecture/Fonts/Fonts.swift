//
//  Fonts.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

struct Fonts {
    enum Title {
        static let h1: UIFont = Pershotravneva().get(.medium, 22)
        static let h2: UIFont = Pershotravneva().get(.medium, 18)
        static let h3: UIFont = Pershotravneva().get(.medium, 16)
        static let h4: UIFont = Pershotravneva().get(.medium, 14)
    }
    
    enum Body {
        static let large: UIFont = PTSansCaption().get(.regular, 16)
        static let medium: UIFont = PTSansCaption().get(.regular, 14)
        static let small: UIFont = PTSansCaption().get(.regular, 12)
    }
    
    enum Label {
        static let large: UIFont = Pershotravneva().get(.regular, 16)
        static let medium: UIFont = Pershotravneva().get(.regular, 14)
        static let small: UIFont = Pershotravneva().get(.regular, 12)
    }
    
    let baseFont: Pershotravneva = Pershotravneva()
    let ubuntu: Pershotravneva = Pershotravneva()
    let ptSansCaption: PTSansCaption = PTSansCaption()
}

class BaseFont: BaseFontProtocol {
    var name: String = "Ubuntu"
}

class Pershotravneva: BaseFontProtocol {
    var name: String = "Pershotravneva55-Regular"
}

class PTSansCaption: BaseFontProtocol {
    var name: String = "PT Sans Caption"
}
