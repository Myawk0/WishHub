//
//  FriendsAssembly.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

class FriendsAssembly: BaseAssembly {
	static func assemble(data: FriendsData? = nil) -> FriendsViewController {
		let view = FriendsViewController()
		let router = FriendsRouter(view)
		let presenter = FriendsPresenter()
		let interactor = FriendsInteractor()
		let network = FriendsNetwork()
		let localization = FriendsLocalization()

		view.presenter = presenter
		view.localization = localization

		presenter.view = view
		presenter.interactor = interactor
		presenter.router = router
		presenter.localization = localization

		interactor.presenter = presenter
		interactor.data = data ?? FriendsData()
		// interactor.storageManager = StorageManager.shared
		interactor.network = network

		return view
	}
}
