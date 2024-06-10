//
//  FriendsPageAssembly.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation
import UIKit

class FriendsPageAssembly: BaseAssembly {
	static func assemble(data: FriendsPageData? = nil) -> FriendsPageViewController {
		let view = FriendsPageViewController()
		let router = FriendsPageRouter(view)
		let presenter = FriendsPagePresenter()
		let interactor = FriendsPageInteractor()
		let network = FriendsPageNetwork()
		let localization = FriendsPageLocalization()
        
		view.presenter = presenter
		view.localization = localization
        
		presenter.view = view
		presenter.interactor = interactor
		presenter.router = router
		presenter.localization = localization
        
		interactor.presenter = presenter
		interactor.data = data ?? FriendsPageData()
        //interactor.storageManager = StorageManager.shared
		interactor.network = network
        
		return view
	}
}
