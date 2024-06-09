//
//  FriendsInteractor.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import Foundation

class FriendsInteractor: BaseInteractor<FriendsData> {
	weak var presenter: FriendsInteractorOutput!
	var storageManager: StorageManager!
	var network: FriendsNetwork!
}
