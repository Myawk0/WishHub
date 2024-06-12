//
//  UserDataItem.swift
//  WishHub
//
//  Created by Мявкo on 12.06.24.
//

import Foundation

enum UserDataItem: CaseIterable {
    case presents
    case friends
    case subscribers
    
    var title: String {
        switch self {
            case .presents:
                return Localizable.UserDataItem.presentsText
            case .friends:
                return Localizable.UserDataItem.friendsText
            case .subscribers:
                return Localizable.UserDataItem.subscribersText
        }
    }
}
