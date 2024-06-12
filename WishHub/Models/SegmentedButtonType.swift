//
//  SegmentedButtonType.swift
//  WishHub
//
//  Created by Мявкo on 12.06.24.
//

import Foundation

enum SegmentedButtonType: CaseIterable {
    case friends
    case applications
    case requests
    
    var title: String {
        switch self {
            case .friends:
                return Localizable.TabBarItem.friendsText
            case .applications:
                return Localizable.SegmentedButton.applicationsText
            case .requests:
                return Localizable.SegmentedButton.requestsText
        }
    }
}
