//
//  ApplicationsPageAssembly.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation

class ApplicationsPageAssembly: BaseAssembly {
	static func assemble(data: ApplicationsPageData? = nil) -> ApplicationsPageViewController {
		let view = ApplicationsPageViewController()
		let router = ApplicationsPageRouter(view)
		let presenter = ApplicationsPagePresenter()
		let interactor = ApplicationsPageInteractor()
		let network = ApplicationsPageNetwork()
		let localization = ApplicationsPageLocalization()

		view.presenter = presenter
		view.localization = localization

		presenter.view = view
		presenter.interactor = interactor
		presenter.router = router
		presenter.localization = localization

		interactor.presenter = presenter
		interactor.data = data ?? ApplicationsPageData()
		// interactor.storageManager = StorageManager.shared
		interactor.network = network

		return view
	}
}
