//
//  UIView+Extension.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

extension UIView {
    
    func getParentViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while responder != nil {
            responder = responder?.next
            if let viewController = responder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
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
    
    enum ViewEdge {
        case left
        case top
        case right
        case bottom
        case all
        case none
    }
    
    func roundEdge(_ edge: ViewEdge) {
        switch edge {
            case .left:
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            case .top:
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            case .right:
                layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            case .bottom:
                layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            case .all:
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            case .none:
                layer.maskedCorners = []
        }
    }
}
