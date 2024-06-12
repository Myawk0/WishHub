//
//  ProfileAssembly.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation
import UIKit

class ProfileAssembly: BaseAssembly {
	static func assemble(data: ProfileData? = nil) -> ProfileViewController {
		let view = ProfileViewController()
		let router = ProfileRouter(view)
		let presenter = ProfilePresenter()
		let interactor = ProfileInteractor()
		let network = ProfileNetwork()
		let localization = ProfileLocalization()
        
		view.presenter = presenter
		view.localization = localization
        
		presenter.view = view
		presenter.interactor = interactor
		presenter.router = router
		presenter.localization = localization
        
		interactor.presenter = presenter
		interactor.data = data ?? ProfileData()
        interactor.storageManager = StorageManager.shared
		interactor.network = network
        
		return view
	}
}
