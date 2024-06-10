//
//  TabBarController.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {
    
    //MARK: - жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        generateTabBar()
        setTabBarAppearance()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        //selectedIndex = 1
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: - настройка UI
    
    private func setupTabBar() {
        setValue(TabBar(frame: tabBar.frame), forKey: "tabBar")
    }
    
    var imageSize: CGSize {
        return CGSize(width: 20, height: 20)
    }
    
    private func generateTabBar() {
        var allViewControllers = [UIViewController]()
        for itemType in TabBarItemType.allCases {
            allViewControllers.append(
                generateVC(
                    viewController: itemType.parentController,
                    title: itemType.itemTitle,
                    image: itemType.itemImage?.resizeImage(size: imageSize),
                    selectedImage: itemType.itemSelectedImage?.resizeImage(size: imageSize)
                )
            )
        }
        viewControllers = allViewControllers
    }
    
    //MARK: - методы и функции
    
    private func generateVC(viewController: BaseViewController, title: String, image: UIImage?, selectedImage: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectedImage?.withTintColor(.darkPastelPurple, renderingMode: .alwaysOriginal)
        return viewController
    }
    
    private func setTabBarAppearance() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: Fonts.Label.small], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: Fonts.Label.medium], for: .selected)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -8)
        
        tabBar.tintColor = .darkPastelPurple
        tabBar.unselectedItemTintColor = .slateGray
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .ghostWhite
        tabBar.addShadow(
            color: .black.withAlphaComponent(0.1),
            radius: 50,
            offset: CGSize(width: 0, height: -2)
        )
    }
    
    private func roundTop() {
        tabBar.layer.cornerRadius = 16
        tabBar.layer.masksToBounds = true
        tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
}

class TabBar: UITabBar {
    
    var tabBarHeight: CGFloat = 100//Constants.tabBarHeight
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let superSize = super.sizeThatFits(size)
        
        return CGSize(width: superSize.width, height: self.tabBarHeight)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var tabFrame = frame
        tabFrame.size.height = tabBarHeight
        tabFrame.origin.y = frame.origin.y + (frame.height - tabBarHeight)
        frame = tabFrame
    }
}
