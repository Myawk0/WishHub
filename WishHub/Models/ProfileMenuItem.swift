//
//  ProfileMenuItem.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import UIKit

enum ProfileMenuItem: CaseIterable {
    case mode
    case settings
    case changePassword
    case logout
    
    var coloredIcon: UIImage? {
        return icon?.withTintColor(.glossyGrape, renderingMode: .alwaysOriginal)
    }
    
    var title: String {
        switch self {
            case .mode:
                return "Темный режим"
            case .settings:
                return "Настройки"
            case .changePassword:
                return "Изменить пароль"
            case .logout:
                return "Выйти из аккаунта"
        }
    }
    
    private var icon: UIImage? {
        switch self {
            case .mode:
                return UIImage(systemName: "moon")
            case .settings:
                return UIImage(systemName: "gearshape")
            case .changePassword:
                return UIImage.lock
            case .logout:
                return UIImage.logout
        }
    }
}
