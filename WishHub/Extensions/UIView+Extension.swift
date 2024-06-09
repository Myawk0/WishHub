//
//  UIView+Extension.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

extension UIView {
    
    func updateLayoutRecursively() {
        layoutIfNeeded()
        if let superview {
            superview.updateLayoutRecursively()
        }
    }
    
    func addShadow(color: UIColor = .lightGray,
                   opacity: Float = 1,
                   radius: CGFloat = 1,
                   offset: CGSize = CGSize(width: 0, height: 2)) {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
    }
}
