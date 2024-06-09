//
//  SegmentedButtonsView.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

enum ButtonType: CaseIterable {
    case friends
    case applications
    case requests
    
    var title: String {
        switch self {
            case .friends:
                return Localizable.TabBarItemTitle.friendsText
            case .applications:
                return Localizable.SegmentedButton.applicationsText
            case .requests:
                return Localizable.SegmentedButton.requestsText
        }
    }
}

class SegmentedButtonsView: UIView {
    
    // MARK: UI elements
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = -1
        return stackView
    }()
    
    private lazy var pageViewController: UIPageViewController = {
        let viewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        viewController.dataSource = self
        viewController.delegate = self
        return viewController
    }()
    
    private var contentControllers: [UIViewController] = {
        let firstPage = UIViewController()
        firstPage.view.backgroundColor = .ghostWhite
        
        let secondPage = UIViewController()
        secondPage.view.backgroundColor = .ghostWhite
        
        let thirdPage = UIViewController()
        thirdPage.view.backgroundColor = .ghostWhite
        
        return [firstPage, secondPage, thirdPage]
    }()
    
    
    // MARK: Variables
    private var buttons: [SegmentedButton] = []
    var buttonType: ButtonType = .friends
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupButtons()
        setupPageViewController()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    // MARK: Setup UI
    private func setupUI() {
        addSubviews()
        makeConstraints()
    }
    
    private func setupPageViewController() {
        if let firstViewController = contentControllers.first {
            pageViewController.setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
    }
    
    private func addSubviews() {
        addSubview(buttonsStackView)
        addSubview(pageViewController.view)
    }
    
    private func makeConstraints() {
        buttonsStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        pageViewController.view.snp.makeConstraints { make in
            make.top.equalTo(buttonsStackView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    
    // MARK: Methods
    private func setupButtons() {
        for (index, type) in ButtonType.allCases.enumerated() {
            let button = SegmentedButton()
            button.title = type.title
            button.tag = index
            button.isSelected = index == 0
//            if index == 0 {
//                button.roundEdge(.left)
//            } else if index == ButtonType.allCases.count - 1 {
//                button.roundEdge(.right)
//            } else {
//                button.roundEdge(.none)
//            }
            button.buttonIsTapped = {
                [weak self] button in
                guard let self = self else { return }
                
                showPage(atIndex: button.tag)
                updateButtonColors(selectedIndex: button.tag)
            }
            buttons.append(button)
            buttonsStackView.addArrangedSubview(button)
        }
    }
    
    private func updateButtonColors(selectedIndex: Int) {
        buttons.enumerated().forEach { index, button in
            button.isSelected = index == selectedIndex
        }
    }
    
    private func showPage(atIndex index: Int) {
        guard index >= 0 && index < contentControllers.count else { return }
        
        let firstViewController = pageViewController.viewControllers?.first ?? UIViewController()
        let currentViewControllerIndex = contentControllers.firstIndex(of: firstViewController) ?? 0
        
        let direction: UIPageViewController.NavigationDirection = index > currentViewControllerIndex ? .forward : .reverse
        
        pageViewController.setViewControllers([contentControllers[index]], direction: direction, animated: true, completion: nil)
    }
}


// MARK: - UIPageViewControllerDataSource

extension SegmentedButtonsView: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = contentControllers.firstIndex(of: viewController), currentIndex > 0 else { return nil }
        return contentControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = contentControllers.firstIndex(of: viewController), currentIndex < contentControllers.count - 1 else { return nil }
        return contentControllers[currentIndex + 1]
    }
}


// MARK: - UIPageViewControllerDelegate

extension SegmentedButtonsView: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let viewController = pageViewController.viewControllers?.first,
               let index = contentControllers.firstIndex(of: viewController) {
                updateButtonColors(selectedIndex: index)
            }
        }
    }
}


