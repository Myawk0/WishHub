//
//  RequestsPageInteractor.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation

class RequestsPageInteractor: BaseInteractor<RequestsPageData> {
	weak var presenter: RequestsPageInteractorOutput!
	// var storageManager: StorageManager!
	var network: RequestsPageNetwork!
}
