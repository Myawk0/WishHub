//
//  HeaderViewController.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit
import SnapKit

class HeaderViewController: UIView {
    
    // MARK: Structs and enums
    enum ButtonAlignment {
        case left, right
    }
    
    // MARK: Properties
    private var buttonWidth: CGFloat = 40.0
    private var leftButtons: [UIButton] = []
    private var rightButtons: [UIButton] = []


    // MARK: UI elements
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
//        view.textColor = .black
//        view.font =
        return view
    }()
    
    private lazy var leftStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        stack.distribution = .equalCentering
        return stack
    }()
    
    private lazy var rightStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        stack.distribution = .equalCentering
        return stack
    }()
    
    
    // MARK: Properties
    var height: CGFloat = 0 {
        didSet {
            snp.remakeConstraints { make in
                make.left.right.equalToSuperview()
                make.top.equalTo(superview?.safeAreaLayoutGuide.snp.top ?? 0.0 )
                make.height.equalTo(height)
            }
        }
    }
    
    var title: String {
        get { titleLabel.text ?? "" }
        set { titleLabel.text = newValue }
    }
    
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        addConstraints()
        
        titleLabel.textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Override method
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
    
    //MARK: - TitleLable functionality
    private var titleTappableText: String = ""
    private var whatToDoWhenTappOnTappableText: (() -> Void)?
    
    public func setTapOnTextOfLabel(text: String, closure: @escaping (() -> Void)) {
        titleTappableText = text
        whatToDoWhenTappOnTappableText = closure
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapLabel))
        titleLabel.addGestureRecognizer(gesture)
        titleLabel.isUserInteractionEnabled = true
    }
    
    @objc private func tapLabel(gesture: UITapGestureRecognizer) {
//        guard let text = titleLabel.text else { return }
//        let textRange = (text as NSString).range(of: titleTappableText)
//        
//        if gesture.didTapTextInLabel(label: titleLabel, inRange: textRange) {
//            whatToDoWhenTappOnTappableText?()
//        }
    }

    
//    @discardableResult
//    func addButton(image: UIImage, type: ButtonAlignment, onTap: ((BaseButton)->())? = nil) -> BaseButton {
//        
//        let button = HeaderButton(width: buttonWidth)
//        button.isHidden = false
//        button.setImage(image, for: .normal)
//        button.onTap = onTap
//        switch type {
//            case .left:
//                leftButtons.append(button)
//                leftStack.addArrangedSubview(button)
//            case .right:
//                rightButtons.append(button)
//                rightStack.addArrangedSubview(button)
//        }
//        button.snp.makeConstraints { make in
//            make.width.height.equalTo(buttonWidth)
//            make.centerY.equalToSuperview()
//        }
//        return button
//    }
    
//    @discardableResult
//    func addButton(title: String, font: UIFont, titleColor: UIColor, type: ButtonAlignment, onTap: ((BaseButton)->())? = nil) -> BaseButton {
//        
//        let button = BaseButton()
//        button.isHidden = false
//        button.setTitle(title, for: .normal)
//        button.titleLabel?.font = font
//        button.setTitleColor(titleColor, for: .normal)
//        button.onTap = onTap
//        switch type {
//            case .left:
//                leftButtons.append(button)
//                leftStack.addArrangedSubview(button)
//            case .right:
//                rightButtons.append(button)
//                rightStack.addArrangedSubview(button)
//        }
//        button.snp.makeConstraints { make in
//            make.width.equalTo(buttonWidth)
//            make.height.equalToSuperview()
//        }
//        return button
//    }
    
    private func setupSubviews(){
        addSubview(titleLabel)
        addSubview(leftStack)
        addSubview(rightStack)
    }
    
    private func addConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.right.equalTo(rightStack.snp.left)
            make.top.bottom.equalToSuperview()
            make.left.equalTo(leftStack.snp.right)
            make.centerX.equalToSuperview()
        }
        leftStack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().inset(16)
        }
        rightStack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().inset(16)
        }
    }
}
