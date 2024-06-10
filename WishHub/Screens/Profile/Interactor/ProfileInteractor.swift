//
//  ProfileInteractor.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation

class ProfileInteractor: BaseInteractor<ProfileData> {
	weak var presenter: ProfileInteractorOutput!
	//var storageManager: StorageManager!
	var network: ProfileNetwork!
}
