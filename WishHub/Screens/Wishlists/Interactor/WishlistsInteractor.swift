//
//  WishlistsInteractor.swift
//  WishHub
//
//  Created by Мявкo on 14.06.24.
//

import Foundation

class WishlistsInteractor: BaseInteractor<WishlistsData> {
	weak var presenter: WishlistsInteractorOutput!
	var storageManager: StorageManager!
	var network: WishlistsNetwork!
}
