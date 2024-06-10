//
//  ApplicationsPageViewOutput.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation
import UIKit

protocol ApplicationsPageViewOutput: BaseViewOutput {
	func onBackButtonTap()
}

extension ApplicationsPagePresenter: ApplicationsPageViewOutput {
	func onBackButtonTap() {
		router.back()
	}
}
