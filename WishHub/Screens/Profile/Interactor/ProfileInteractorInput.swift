//
//  ProfileInteractorInput.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation

protocol ProfileInteractorInput: BaseInteractorInput {
    func darkThemeStateChanged(isOn: Bool)
}

extension ProfileInteractor: ProfileInteractorInput {

    func darkThemeStateChanged(isOn: Bool) {
        storageManager.isDarkMode = isOn
    }
}
