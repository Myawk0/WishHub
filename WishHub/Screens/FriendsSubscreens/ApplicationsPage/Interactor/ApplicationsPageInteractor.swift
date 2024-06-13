//
//  ApplicationsPageInteractor.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation

class ApplicationsPageInteractor: BaseInteractor<ApplicationsPageData> {
	weak var presenter: ApplicationsPageInteractorOutput!
	// var storageManager: StorageManager!
	var network: ApplicationsPageNetwork!
}
