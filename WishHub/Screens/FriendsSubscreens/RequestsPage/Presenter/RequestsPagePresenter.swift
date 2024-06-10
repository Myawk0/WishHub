//
//  RequestsPagePresenter.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation


class RequestsPagePresenter: BasePresenter {
    weak var view: RequestsPageViewInput!
    var interactor: RequestsPageInteractorInput!
    var router: RequestsPageRouter!
    var localization: RequestsPageLocalization!
}
