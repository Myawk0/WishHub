//
//  TabBarController.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

class TabBarController: UITabBarController {
    
    //MARK: Properties
    var imageSize: CGSize {
        return CGSize(width: 20, height: 20)
    }
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        generateTabBar()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        selectedIndex = 2
    }
    
    
    //MARK: Setup UI
    private func setupTabBar() {
        setValue(TabBar(frame: tabBar.frame), forKey: "tabBar")
    }
    
    private func generateTabBar() {
        viewControllers = TabBarItemType.allCases.map { itemType in
            generateVC(
                viewController: itemType.parentController,
                title: itemType.itemTitle,
                image: itemType.itemImage?.resizeImage(size: imageSize),
                selectedImage: itemType.itemSelectedImage?.resizeImage(size: imageSize)
            )
        }
    }
    
    
    //MARK: Methods
    private func generateVC(viewController: BaseViewController, title: String, image: UIImage?, selectedImage: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectedImage?.withTintColor(.darkPastelPurple, renderingMode: .alwaysOriginal)
        return viewController
    }
}
