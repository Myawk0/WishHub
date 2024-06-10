//
//  ProfileViewOutput.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation
import UIKit

protocol ProfileViewOutput: BaseViewOutput {
	func onBackButtonTap()
}

extension ProfilePresenter: ProfileViewOutput {
	func onBackButtonTap() {
		router.back()
	}
}
