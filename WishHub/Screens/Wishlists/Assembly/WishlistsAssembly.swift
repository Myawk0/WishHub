//
//  WishlistsAssembly.swift
//  WishHub
//
//  Created by Мявкo on 14.06.24.
//

import Foundation
import UIKit

class WishlistsAssembly: BaseAssembly {
	static func assemble(data: WishlistsData? = nil) -> WishlistsViewController {
		let view = WishlistsViewController()
		let router = WishlistsRouter(view)
		let presenter = WishlistsPresenter()
		let interactor = WishlistsInteractor()
		let network = WishlistsNetwork()
		let localization = WishlistsLocalization()
        
		view.presenter = presenter
		view.localization = localization
        
		presenter.view = view
		presenter.interactor = interactor
		presenter.router = router
		presenter.localization = localization
        
		interactor.presenter = presenter
		interactor.data = data ?? WishlistsData()
		interactor.storageManager = StorageManager.shared
		interactor.network = network
        
		return view
	}
}
