//
//  FriendsViewController.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

class FriendsViewController: BaseViewController {
    

    //MARK: Architecture
    var localization: FriendsLocalization!
    var presenter: FriendsViewOutput!


    //MARK: Structs and Enums


    //MARK: UI elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = localization.friendsText
        label.font = Fonts.Title.h1
        label.textColor = .slateGray
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = localization.findFriendsText
        label.font = Fonts.Label.large
        label.textColor = .slateGray
        return label
    }()
    
    private lazy var segmentedButtonsView: SegmentedButtonsView = {
        let view = SegmentedButtonsView()
        view.buttonTitles = ["Друзья", "Заявки", "Запросы"]
        view.buttonIsTapped = {
            [weak self] index in
            guard let self = self else { return }
        
            self.showPage(atIndex: index)
        }
        return view
    }()
    
    private lazy var pageViewController: UIPageViewController = {
        let viewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        viewController.dataSource = self
        viewController.delegate = self
        return viewController
    }()
    
    private var contentControllers: [UIViewController] = {
        let firstPage = UIViewController()
        firstPage.view.backgroundColor = .systemYellow
        
        let secondPage = UIViewController()
        secondPage.view.backgroundColor = .systemMint
        
        let thirdPage = UIViewController()
        thirdPage.view.backgroundColor = .systemPink
        
        return [firstPage, secondPage, thirdPage]
    }()


    //MARK: Variables


    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPageViewController()
    }
    

    //MARK: Setup UI
    private func setupUI() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(segmentedButtonsView)
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }

    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        segmentedButtonsView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        pageViewController.view.snp.makeConstraints { make in
            make.top.equalTo(segmentedButtonsView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    
    //MARK: Methods
    
    private func setupPageViewController() {
        if let firstViewController = contentControllers.first {
            pageViewController.setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
    }
    
    private func showPage(atIndex index: Int) {
        guard index >= 0 && index < contentControllers.count else { return }
        
        let currentViewControllerIndex = contentControllers.firstIndex(of: pageViewController.viewControllers?.first ?? UIViewController()) ?? 0
        
        let direction: UIPageViewController.NavigationDirection = index > currentViewControllerIndex ? .forward : .reverse
        
        pageViewController.setViewControllers([contentControllers[index]], direction: direction, animated: true, completion: nil)
    }
}

extension FriendsViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = contentControllers.firstIndex(of: viewController), currentIndex > 0 else { return nil }
        return contentControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = contentControllers.firstIndex(of: viewController), currentIndex < contentControllers.count - 1 else { return nil }
        return contentControllers[currentIndex + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return contentControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let currentViewController = pageViewController.viewControllers?.first, let currentIndex = contentControllers.firstIndex(of: currentViewController) else { return 0 }
        return currentIndex
    }
}
