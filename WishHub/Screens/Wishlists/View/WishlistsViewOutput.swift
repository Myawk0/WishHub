//
//  WishlistsViewOutput.swift
//  WishHub
//
//  Created by Мявкo on 14.06.24.
//

import Foundation
import UIKit

protocol WishlistsViewOutput: BaseViewOutput {
	func onBackButtonTap()
}

extension WishlistsPresenter: WishlistsViewOutput {
	func onBackButtonTap() {
		router.back()
	}
}
