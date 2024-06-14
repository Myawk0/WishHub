//
//  WishlistsPresenter.swift
//  WishHub
//
//  Created by Мявкo on 14.06.24.
//

import Foundation


class WishlistsPresenter: BasePresenter {
    weak var view: WishlistsViewInput!
    var interactor: WishlistsInteractorInput!
    var router: WishlistsRouter!
    var localization: WishlistsLocalization!
}
