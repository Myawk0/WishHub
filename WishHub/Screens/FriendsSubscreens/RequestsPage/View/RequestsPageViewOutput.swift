//
//  RequestsPageViewOutput.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation
import UIKit

protocol RequestsPageViewOutput: BaseViewOutput {
	func onBackButtonTap()
}

extension RequestsPagePresenter: RequestsPageViewOutput {
	func onBackButtonTap() {
		router.back()
	}
}
