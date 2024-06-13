//
//  BasePresenter.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import Foundation

class BasePresenter: NSObject {
    var hasNetworkAccess: Bool = true
}

extension BasePresenter: InternetConnectionProtocol {
    func onConnection() {
        hasNetworkAccess = true
        print("onConnection")
    }

    func onDisconnection() {
        print("onDisconnection")
        hasNetworkAccess = false
    }
}

protocol InternetConnectionProtocol: NSObject {
    func onConnection()
    func onDisconnection()
}
