//
//  SegmentedButton.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

class SegmentedButton: UIButton {
    
    // MARK: - Variables
    
    var buttonBorder: CALayer?
    var buttonIsTapped: ((SegmentedButton)->())?
    
    override var isSelected: Bool {
        didSet {
            let color: UIColor = isSelected ? selectedColor : .slateGray
            setTitleColor(color, for: .normal)
            //backgroundColor = isSelected ? .americanSilver : .ghostWhite
            isSelected ? addBottomBorder() : removeBottomBorder()
            layoutIfNeeded()
        }
    }
    
    var title: String = "" {
        didSet {
            setTitle(title, for: .normal)
        }
    }
    
    private let selectedColor: UIColor = .systemPink
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layoutSubviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        isSelected ? addBottomBorder() : removeBottomBorder()
    }
    
    // MARK: - Methods
    
    private func setupAppearance() {
        setTitleColor(.slateGray, for: .normal)
        
        setupAction()
    }
    
    private func setupAction() {
        let action = UIAction { _ in
            self.buttonIsTapped?(self)
        }
        addAction(action, for: .touchUpInside)
    }
    
    private func addBottomBorder() {
        removeBottomBorder()
        
        let borderWidth: CGFloat = 2
        let border = CALayer()
        buttonBorder = border
        border.backgroundColor = selectedColor.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
        layer.addSublayer(border)
    }
    
    private func removeBottomBorder() {
        guard let border = buttonBorder else { return }
        border.removeFromSuperlayer()
        buttonBorder = nil
    }
}

