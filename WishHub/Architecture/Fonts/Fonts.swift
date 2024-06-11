//
//  Fonts.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

struct Fonts {
    enum Title {
        static let h1: UIFont = Pershotravneva().get(.regular, 50)
        static let h2: UIFont = Pershotravneva().get(.regular, 30)
        static let h3: UIFont = Pershotravneva().get(.regular, 26)
        static let h4: UIFont = Pershotravneva().get(.regular, 14)
    }
    
    enum Body {
        static let large: UIFont = Ubuntu().get(.bold, 16)
        static let largeMedium: UIFont = Ubuntu().get(.medium, 20)
        static let medium: UIFont = Ubuntu().get(.medium, 14)
        static let small: UIFont = Ubuntu().get(.regular, 12)
        static let smallMedium: UIFont = Ubuntu().get(.medium, 12)
    }
    
    enum Label {
        static let large: UIFont = PTSansCaption().get(.regular, 20)
        static let big: UIFont = PTSansCaption().get(.regular, 16)
        static let medium: UIFont = PTSansCaption().get(.regular, 14)
        static let small: UIFont = PTSansCaption().get(.regular, 12)
    }
}

class Ubuntu: BaseFontProtocol {
    var name: String = "Ubuntu"
}

class Pershotravneva: BaseFontProtocol {
    var name: String = "Pershotravneva55"
}

class PTSansCaption: BaseFontProtocol {
    var name: String = "PT Sans Caption"
    
    func get(_ style: BaseFontStyle = .regular, _ size: CGFloat = 15) -> UIFont {
        return UIFont(name: name, size: size) ?? UIFont()
    }
}
