//
//  ProfileViewOutput.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation

protocol ProfileViewOutput: BaseViewOutput {
    func viewDidLoaded()
    func themeModeSwitcherIsTapped(isOn: Bool)
}

extension ProfilePresenter: ProfileViewOutput {

    func viewDidLoaded() {

    }

    func themeModeSwitcherIsTapped(isOn: Bool) {
        interactor.darkThemeStateChanged(isOn: isOn)
    }
}
