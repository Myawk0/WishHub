//
//  BaseRouter.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

class BaseRouter: NSObject {

    weak var navigation: NavigationProtocol!

    var countViewControllersInStack: Int {
        return navigation.topViewController?.navigationController?.viewControllers.count ?? 0
    }

    var viewControllers: [UIViewController]? {
        get {
            return navigation.topViewController?.navigationController?.viewControllers
        }
        set {
            guard let navigationController = navigation.topViewController?.navigationController else { return }
            navigationController.viewControllers = newValue ?? []
        }
    }

    init(_ navigation: NavigationProtocol) {
        self.navigation = navigation
    }

    func back(over: Int = 0, animated: Bool = true, completion: (() -> Void)? = nil) {
        removePreviousScreens(over)
        navigation.dismissOrPop(animated: animated, completion)
    }

    func open(viewController: UIViewController, removeCurrent: Bool = false, animated: Bool = true, _ completion: (() -> Void)? = nil) {
        navigation.presentOrPush(viewController: viewController, removeCurrent: removeCurrent, animated: animated, completion)
    }

    func openAsBottomSheet(viewController: UIViewController, _ completion: (() -> Void)? = nil) {
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical
        navigation.presentModal(viewController: viewController, animated: true, nil)
    }

    func removeFromStack(_ position: Int) {
        if let topViewController = navigation.topViewController {
            guard let count = topViewController.navigationController?.viewControllers.count, count > position else {
                return
            }
            topViewController.navigationController?.viewControllers.remove(at: position)
        }
    }

    func removePreviousScreens(_ count: Int) {
        for _ in 0..<count {
            removePreviousScreen()
        }
    }

    func removePreviousScreens(_ count: Int, removeCurrent: Bool, andOpen newVC: BaseViewController) {
        for _ in 0..<count {
            removePreviousScreen()
        }
        navigation.presentOrPush(viewController: newVC, removeCurrent: removeCurrent, animated: true, nil)
    }

    func removePreviousScreen() {
        guard let topViewController = navigation.topViewController, let count = topViewController.navigationController?.viewControllers.count else {
            return
        }
        topViewController.navigationController?.viewControllers.remove(at: count - 2)
    }

    func popToRootViewController(animated: Bool) {
        navigation.popToRootViewController(animated: animated)
    }

    func removeAllPreviousScreensInStack(except currentVC: UIViewController) {
        guard let navigationController = navigation.topViewController?.navigationController else { return }
        navigationController.viewControllers = [currentVC]
    }
}
