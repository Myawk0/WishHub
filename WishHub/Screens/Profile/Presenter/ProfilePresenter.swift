//
//  ProfilePresenter.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation


class ProfilePresenter: BasePresenter {
    weak var view: ProfileViewInput!
    var interactor: ProfileInteractorInput!
    var router: ProfileRouter!
    var localization: ProfileLocalization!
}
