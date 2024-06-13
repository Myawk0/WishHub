//
//  BaseViewController.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

class BaseViewController: UIViewController, NavigationProtocol {

    var firstTime: Bool = true
    var keyboardSensitiveConstraints: KeyboardSensitiveConstraints!
    var keyboardService: KeyboardService = KeyboardService()

    var backBySwipe: Bool = false {
        didSet {
            guard let screensIntoStackCount: Int = navigationController?.viewControllers.count else { return }

            if backBySwipe, screensIntoStackCount <= 1 {
                backBySwipe = false
                return
            }

            navigationController?.interactivePopGestureRecognizer?.isEnabled = backBySwipe
        }
    }

    var dismissKeyboardOnTapAround: Bool = true {
        didSet {
            hideKeyboardWhenTappedAround(hide: dismissKeyboardOnTapAround)
        }
    }

    // var appearance: Appearance = Appearance.sharedInstance
    lazy var header: HeaderViewController = HeaderViewController()
    var pushAnimation: UIViewControllerAnimatedTransitioning?
    var popAnimation: UIViewControllerAnimatedTransitioning?
    let defaultNavigationBarHeight: CGFloat = 50
    var tapToDismissKeyboard: UITapGestureRecognizer!
    var gestureRecognizerShouldBegin: ((UIGestureRecognizer) -> (Bool))?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .ghostWhite
        setupDismissRecognizer()
        setupNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        keyboardSensitiveConstraints = KeyboardSensitiveConstraints(view: self.view)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        backBySwipe = true
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        firstTime = false
    }

    func setupNavigationBar() {
        view.insertSubview(header, at: 10000)
        header.height = defaultNavigationBarHeight
        header.backgroundColor = .clear
    }

    func setupDismissRecognizer() {
        tapToDismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        dismissKeyboardOnTapAround = true
    }

    func resignFirstResponderAnywhere() {
        let mock: UITextField = UITextField()
        self.view.addSubview(mock)
        mock.becomeFirstResponder()
        mock.resignFirstResponder()
        mock.removeFromSuperview()
    }
}

extension BaseViewController: UIGestureRecognizerDelegate {
    // Распознавание жестов для возврата на предыдущий экран свайпом, можно сделать условия, чтобы другие жесты пропускал
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    // Должен ли начать распознавать касания
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return gestureRecognizerShouldBegin?(gestureRecognizer) ?? true
    }
}

extension BaseViewController {
    func hideKeyboardWhenTappedAround(hide: Bool = true) {
        if hide {
            tapToDismissKeyboard.cancelsTouchesInView = false
            view.addGestureRecognizer(tapToDismissKeyboard)
        } else {
            view.removeGestureRecognizer(tapToDismissKeyboard)
        }
    }
}
