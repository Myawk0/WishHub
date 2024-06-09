//
//  FriendsViewOutput.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import Foundation
import UIKit

protocol FriendsViewOutput: BaseViewOutput {
	func onBackButtonTap()
}

extension FriendsPresenter: FriendsViewOutput {
	func onBackButtonTap() {
		router.back()
	}
}
