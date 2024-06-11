//
//  TabBar.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import UIKit

class TabBar: UITabBar {
    
    //MARK: Properties
    private let tabBarHeight: CGFloat = Constants.tabBarHeight
    
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        roundTopEdge()
        setupTabBarAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: Override methods
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let superSize = super.sizeThatFits(size)
        return CGSize(width: superSize.width, height: tabBarHeight)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var tabFrame = frame
        tabFrame.size.height = tabBarHeight
        tabFrame.origin.y = frame.origin.y + (frame.height - tabBarHeight)
        frame = tabFrame
    }
    
    
    // MARK: Methods
    private func roundTopEdge() {
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: 0,
                y: bounds.minY,
                width: bounds.width,
                height: tabBarHeight
            ),
            cornerRadius: 20
        )
        
        roundLayer.path = bezierPath.cgPath
        layer.insertSublayer(roundLayer, at: 0)
        
        itemWidth = bounds.width / 4
        itemPositioning = .centered
        roundLayer.fillColor = UIColor.ghostWhite.cgColor
    }
    
    private func setupTabBarAppearance() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: Fonts.Label.small], for: .normal)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -8)
       
        tintColor = .darkPastelPurple
        unselectedItemTintColor = .slateGray
        
        shadowImage = UIImage()
        backgroundImage = UIImage()
        backgroundColor = .clear
        addShadow(
            color: .slateGray.withAlphaComponent(0.12),
            opacity: 1,
            radius: 5,
            offset: CGSize(width: 0, height: -2)
        )
    }
}
