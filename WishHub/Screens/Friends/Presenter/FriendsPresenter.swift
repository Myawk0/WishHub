//
//  FriendsPresenter.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import Foundation

class FriendsPresenter: BasePresenter {
    weak var view: FriendsViewInput!
    var interactor: FriendsInteractorInput!
    var router: FriendsRouter!
    var localization: FriendsLocalization!
}
