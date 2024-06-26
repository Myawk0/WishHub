//
//  Localizable.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import Foundation

class Localizable: BaseLocalization {
    
    enum TabBarItem {
        static var wishlistsText: String { ("wishlistsText".localize) }
        static var friendsText: String { ("friendsText".localize) }
        static var profileText: String { ("profileText".localize) }
    }
    
    enum SegmentedButton {
        static var applicationsText: String { ("applicationsText".localize) }
        static var requestsText: String { ("requestsText".localize) }
    }

    enum Alert {
        static var cameraAccessDeniedTitle: String { ("cameraAccessDeniedTitle".localize) }
        static var cameraAccessDeniedDescription: String { ("cameraAccessDeniedDescription".localize) }
        static var libraryAccessDeniedTitle: String { ("libraryAccessDeniedTitle".localize) }
        static var libraryAccessDeniedDescription: String { ("libraryAccessDeniedDescription".localize) }
        static var cancelButtonText: String { ("cancelButtonText".localize) }
        static var openSettingsButtonText: String { ("openSettingsButtonText".localize) }
    }
    
    enum UserDataItem {
        static var presentsText: String { ("presentsText".localize) }
        static var friendsText: String { ("friendsText".localize) }
        static var subscribersText: String { ("subscribersText".localize) }
    }
}
