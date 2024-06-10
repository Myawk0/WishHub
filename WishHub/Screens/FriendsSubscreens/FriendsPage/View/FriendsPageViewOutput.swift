//
//  FriendsPageViewOutput.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation
import UIKit

protocol FriendsPageViewOutput: BaseViewOutput {
	func onBackButtonTap()
}

extension FriendsPagePresenter: FriendsPageViewOutput {
	func onBackButtonTap() {
		router.back()
	}
}
