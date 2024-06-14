//
//  BaseTextField.swift
//  iOSDepartment
//
//  Created by 7Winds - Sokol on 10.09.2021.
//  Copyright © 2021 Stroev. All rights reserved.
//

import UIKit

class BaseTextField: UITextField {
    var onTextChanged: ((BaseTextField, String) -> Void)? {
        didSet {
            addTarget(self, action: #selector(onTextChangedHandler), for: UIControl.Event.editingChanged)
            isUserInteractionEnabled = true
        }
    }
    
    @objc func onTextChangedHandler(textField: UITextField) {
        onTextChanged?(self, text ?? "")
    }
    
    var textFieldDidBeginEditing: ((BaseTextField, String) -> Void)?
    var textFieldDidEndEditing: ((BaseTextField, String) -> Void)?
    var textFieldDidChangeSelection: ((BaseTextField, String) -> Void)?
    
    var limitOfSymbols: ((Int) -> Bool)? // пока не реализовано
    
    var nextTextField: UITextField?
    var onNextTextField: ((UITextField, UITextField, String) -> Void)?
    var onReturn: (() -> Void)?
    var onShouldChangeCharactersIn: ((UITextField, NSRange, String) -> Bool)?
    var textFieldShouldEndEditing: ((UITextField) -> Bool)?
    var onDeleteBackward: (() -> Void)?
    
    // Отступы
    var leftPadding: (() -> CGFloat)?
    var rightPadding: (() -> CGFloat)?
    var topPadding: (() -> CGFloat)?
    var bottomPadding: (() -> CGFloat)?
    var padding: UIEdgeInsets { UIEdgeInsets(
        top: topPadding?() ?? defaultTopPadding,
        left: leftPadding?() ?? defaultLeftPadding,
        bottom: bottomPadding?() ?? defaultBottomPadding,
        right: rightPadding?() ?? defaultRightPadding
    )}
    
    let defaultLeftPadding: CGFloat = 16
    let defaultRightPadding: CGFloat = 16
    let defaultTopPadding: CGFloat = 0
    let defaultBottomPadding: CGFloat = 0
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        delegate = self
        keyboardAppearance = UIKeyboardAppearance.dark
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        onDeleteBackward?()
    }
    
    override func deleteBackward() {
        super.deleteBackward()
        onDeleteBackward?()
    }
    
    func onTextFieldDidBeginEditing() {}
    func onTextFieldDidEndEditing() {}
}

extension BaseTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        onTextFieldDidBeginEditing()
        textFieldDidBeginEditing?(self, text ?? "")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        onTextFieldDidEndEditing()
        textFieldDidEndEditing?(self, text ?? "")
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textFieldDidChangeSelection?(self, text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        onReturn?()
        if let nextTextField {
            onNextTextField?(self, nextTextField, text ?? "")
            nextTextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return onShouldChangeCharactersIn?(textField, range, string) ?? true
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
