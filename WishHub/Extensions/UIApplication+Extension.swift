//
//  UIApplication+Extension.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

extension UIApplication {
    var keyWindow: UIWindow? {
        return self.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}
