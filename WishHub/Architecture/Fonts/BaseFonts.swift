//
//  BaseFonts.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

protocol BaseFontProtocol {
    var name: String { get }
}

extension BaseFontProtocol {
    func get(_ style: BaseFontStyle = .regular, _ size: CGFloat = 15) -> UIFont {
        return UIFont(name: "\(String(describing: name))-\(style.value)", size: size) ?? UIFont()
    }
}

enum BaseFontStyle: String {
    case regular, medium, bold, semibold, light, black, thin, italic
    
    var value: String { rawValue.firstCapitalized }
}
