//
//  ApplicationsPagePresenter.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation


class ApplicationsPagePresenter: BasePresenter {
    weak var view: ApplicationsPageViewInput!
    var interactor: ApplicationsPageInteractorInput!
    var router: ApplicationsPageRouter!
    var localization: ApplicationsPageLocalization!
}
