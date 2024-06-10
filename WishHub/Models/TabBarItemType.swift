//
//  TabBarItemType.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import UIKit

enum TabBarItemType: CaseIterable {
    case friends
    case wishlists
    case profile
    
    var itemTitle: String {
        switch self {
            case .friends:
                return Localizable.TabBarItemTitle.friendsText
            case .wishlists:
                return Localizable.TabBarItemTitle.wishlistsText
            case .profile:
                return Localizable.TabBarItemTitle.profileText
        }
    }
    
    var parentController: BaseViewController {
        switch self {
            case .friends:
                return FriendsAssembly.assemble()
            case .wishlists:
                return BaseViewController()
            case .profile:
                return ProfileAssembly.assemble()
        }
    }
    
    var itemImage: UIImage? {
        switch self {
            case .friends:
                return Images.TabBarItem.friends
            case .wishlists:
                return Images.TabBarItem.wishlists
            case .profile:
                return Images.TabBarItem.profile
        }
    }
    
    var itemSelectedImage: UIImage? {
        switch self {
            case .friends:
                return Images.TabBarItem.friendsSelected
            case .wishlists:
                return Images.TabBarItem.wishlistsSelected
            case .profile:
                return Images.TabBarItem.profileSelected
        }
    }
}
