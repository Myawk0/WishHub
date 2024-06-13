//
//  NavigationProtocol.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

protocol NavigationProtocol: NSObject {
    var topViewController: UIViewController? { get }
    var rootViewController: UIViewController? { get }
    func presentOrPush(viewController: UIViewController, removeCurrent: Bool, animated: Bool, _ completion: (() -> Void)?)
    func dismissOrPop(animated: Bool, _ completion: (() -> Void)?)
    func presentModal(viewController: UIViewController, animated: Bool, _ completion: (() -> Void)?)
    func popToRootViewController(animated: Bool)
    func changeTransitionAnimation(type: CATransitionType, subtype: CATransitionSubtype?)
}

extension NavigationProtocol where Self: UIResponder {

    private static var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
    }

    var topViewController: UIViewController? {
        return topViewController()
    }

    var rootViewController: UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController
    }

    private func topViewController(controller: UIViewController? = Self.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }

    func dismissOrPop(animated: Bool = true, _ completion: (() -> Void)? = nil) {
        if let topVc = topViewController() {
            if topVc.isModal {
                topVc.dismiss(animated: animated, completion: completion)
            } else {
                topVc.navigationController?.popViewController(animated: animated)
            }
        }
    }

    func presentOrPush(viewController: UIViewController, removeCurrent: Bool = false, animated: Bool = true, _ completion: (() -> Void)? = nil) {
        if let topViewController = topViewController() {
            if topViewController.isModal {
                topViewController.present(viewController, animated: animated, completion: completion)
            } else {
                topViewController.navigationController?.pushViewController(viewController, animated: animated)
                guard removeCurrent, let count = topViewController.navigationController?.viewControllers.count, count >= 2 else { return }
                topViewController.navigationController?.viewControllers.remove(at: count - 2)
            }
        }
    }

    func removeFromStack(_ position: Int) {
        if let topViewController = topViewController() {
            guard let count = topViewController.navigationController?.viewControllers.count, count > position else {
                return
            }
            topViewController.navigationController?.viewControllers.remove(at: position)
        }
    }

    func presentModal(viewController: UIViewController, animated: Bool = true, _ completion: (() -> Void)? = nil) {
        if let topViewController = topViewController() {
            topViewController.present(viewController, animated: animated, completion: completion)
        }
    }

    func popToRootViewController(animated: Bool) {
        if let topViewController = topViewController() {
            topViewController.navigationController?.popToRootViewController(animated: animated)
        }
    }

    func changeTransitionAnimation(type: CATransitionType, subtype: CATransitionSubtype? = .fromLeft) {
        if let topViewController = topViewController() {
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = type
            transition.subtype = subtype

            topViewController.navigationController?.view.layer.add(transition, forKey: kCATransition)
        }
    }
}
