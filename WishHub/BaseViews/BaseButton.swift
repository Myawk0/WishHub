//
//  BaseButton.swift
//  iOSDepartment
//
//  Created by Александр Строев on 20.09.2020.
//  Copyright © 2020 Stroev. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    
    var shouldAnimateOnTap: Bool = true
    var actionAfterAnimation = false
    var animationScaleTo: CGFloat = 0.95
    
    var underline: Bool = false {
        didSet {
            let attributedString = NSMutableAttributedString(string: "")
            if underline {
                let attrs = [NSAttributedString.Key.underlineStyle: 1,
                             NSAttributedString.Key.foregroundColor: titleColor(for: .normal)
                             ?? UIColor.black] as [NSAttributedString.Key: Any]
                let buttonTitleStr = NSMutableAttributedString(string: title(for: .normal) ?? "", attributes: attrs)
                attributedString.append(buttonTitleStr)
            }
            setAttributedTitle(attributedString, for: .normal)
        }
    }
    
    var onTap: ((BaseButton) -> Void)? {
        didSet {
            removeTarget(self, action: #selector(onTapHandler), for: .touchUpInside)
            addTarget(self, action: #selector(onTapHandler), for: .touchUpInside)
            isUserInteractionEnabled = true
        }
    }
    
    var onTapFromGesture: ((BaseButton) -> Void)? {
        didSet {
            let gesture = UITapGestureRecognizer()
            gesture.addTarget(self, action: #selector(onTapFromGestureHandler))
            
            self.addGestureRecognizer(gesture)
        }
    }
    
    var onLongTap: ((BaseButton) -> Void)? {
        didSet {
            removeGestureRecognizer(longPressRecognizer)
            addGestureRecognizer(longPressRecognizer)
        }
    }
    
    var onLongPressed: ((BaseButton) -> Void)? {
        didSet {
            removeGestureRecognizer(longPressRecognizer)
            addGestureRecognizer(longPressRecognizer)
        }
    }
    
    var longPressDuration: CGFloat = 0.5 {
        didSet {
            removeGestureRecognizer(longPressRecognizer)
            addGestureRecognizer(longPressRecognizer)
        }
    }
    
    lazy var longPressRecognizer: UILongPressGestureRecognizer = {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(onLongPressedHandler))
        longPressRecognizer.minimumPressDuration = Double(longPressDuration)
        return longPressRecognizer
    }()
    
    @objc final func onTapHandler() {
        guard shouldAnimateOnTap else {
            onTap?(self)
            return
        }
        
        self.tapAnimation(scaleTo: animationScaleTo) { [weak self] in
            guard let self = self else { return }
            if self.actionAfterAnimation {
                self.onTap?(self)
            }
        }
        if !self.actionAfterAnimation {
            onTap?(self)
        }
    }
    
    @objc final func onTapFromGestureHandler() {
        self.tapAnimation { [weak self] in
            guard let self = self else { return }
            self.onTapFromGesture?(self)
        }
    }
    
    @objc final func onLongTapHandler() {
        onLongTap?(self)
    }
    
    @objc final func onLongPressedHandler() {
        if longPressRecognizer.state == .ended {
            onLongTap?(self)
        }
        
        if longPressRecognizer.state == .began {
            onLongPressed?(self)
        }
    }
    
    var text: String {
        get { title(for: .normal) ?? "" }
        set { setTitle(newValue, for: .normal) }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        isExclusiveTouch = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
