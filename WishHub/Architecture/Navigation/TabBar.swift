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
    private var roundLayer: CAShapeLayer?
    
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
    func changeColors(isDarkTheme: Bool) {
        guard let roundLayer else { return }
        roundLayer.fillColor = isDarkTheme ? UIColor.glossyGrape.cgColor : UIColor.ghostWhite.cgColor
        tintColor = isDarkTheme ? .glossyGrapeDark : .glossyGrape
        unselectedItemTintColor = isDarkTheme ? .independence : .slateGray
    }
    
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
        self.roundLayer = roundLayer
    }
    
    private func setupTabBarAppearance() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: Fonts.Body.small], for: .normal)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -8)
       
        tintColor = .glossyGrape
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
