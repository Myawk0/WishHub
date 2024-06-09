//
//  UIViewController+Extension.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

extension UIViewController {
    
    var isModal: Bool {
        return presentingViewController != nil ||
        navigationController?.presentingViewController?.presentedViewController === navigationController ||
        tabBarController?.presentingViewController is UITabBarController
    }
    
    var isVisible: Bool {
        if isViewLoaded {
            return view.window != nil
        }
        return false
    }
    
    var isTopViewController: Bool {
        if self.navigationController != nil {
            return self.navigationController?.visibleViewController === self
        } else if self.tabBarController != nil {
            return self.tabBarController?.selectedViewController == self && self.presentedViewController == nil
        } else {
            return self.presentedViewController == nil && self.isVisible
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
}

