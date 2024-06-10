//
//  Images.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import UIKit

struct Images {
    
    enum FriendsPages {
        static let friends: UIImage? = UIImage.friends
        static let applications: UIImage? = UIImage.applications
        static let requests: UIImage? = UIImage.requests
    }
    
    enum TabBarItem {
        static let friends: UIImage? = UIImage.handshake
        static let friendsSelected: UIImage? = UIImage.selectedHandshake
        
        static let wishlists: UIImage? = UIImage(systemName: "wand.and.stars.inverse")
        static let wishlistsSelected: UIImage? = UIImage(systemName: "wand.and.stars")
        
        static let profile: UIImage? = UIImage(systemName: "person")
        static let profileSelected: UIImage? = UIImage(systemName: "person.fill")
    }
}
