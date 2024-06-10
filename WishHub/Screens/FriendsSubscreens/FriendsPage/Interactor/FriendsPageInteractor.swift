//
//  FriendsPageInteractor.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation

class FriendsPageInteractor: BaseInteractor<FriendsPageData> {
	weak var presenter: FriendsPageInteractorOutput!
	//var storageManager: StorageManager!
	var network: FriendsPageNetwork!
}
