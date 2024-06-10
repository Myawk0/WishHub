//
//  RequestsPageAssembly.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation
import UIKit

class RequestsPageAssembly: BaseAssembly {
	static func assemble(data: RequestsPageData? = nil) -> RequestsPageViewController {
		let view = RequestsPageViewController()
		let router = RequestsPageRouter(view)
		let presenter = RequestsPagePresenter()
		let interactor = RequestsPageInteractor()
		let network = RequestsPageNetwork()
		let localization = RequestsPageLocalization()
        
		view.presenter = presenter
		view.localization = localization
        
		presenter.view = view
		presenter.interactor = interactor
		presenter.router = router
		presenter.localization = localization
        
		interactor.presenter = presenter
		interactor.data = data ?? RequestsPageData()
		//interactor.storageManager = StorageManager.shared
		interactor.network = network
        
		return view
	}
}
