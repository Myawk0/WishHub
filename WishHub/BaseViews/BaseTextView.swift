//
//  BaseTextView.swift
//  Progressive
//
//  Created by 7Winds on 17.12.2021.
//

import UIKit

class BaseTextView: UITextView {
    
    var onDidBeginEditing: ((BaseTextView) -> Void)?
    var onDidEndEditing: ((BaseTextView) -> Void)?
    var onTextViewDidChange: ((BaseTextView) -> Void)?
    var shouldChangeTextIn: ((BaseTextView, NSRange, String) -> Bool)?
    
    // Отступы
    var leftPadding: (() -> CGFloat)?
    var rightPadding: (() -> CGFloat)?
    var topPadding: (() -> CGFloat)?
    var bottomPadding: (() -> CGFloat)?
    var padding: UIEdgeInsets { UIEdgeInsets(
        top: topPadding?() ?? defaultTopPadding,
        left: leftPadding?() ?? defaultLeftPadding,
        bottom: bottomPadding?() ?? defaultBottomPadding,
        right: rightPadding?() ?? defaultRightPadding)
    }
    
    let defaultLeftPadding: CGFloat = 12
    let defaultRightPadding: CGFloat = 12
    let defaultTopPadding: CGFloat = 10
    let defaultBottomPadding: CGFloat = 10
    
    var isTextCenterVertically: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textContainer.lineFragmentPadding = 0
        
        delegate = self
    }
    
    override init(frame: CGRect = CGRect.zero, textContainer: NSTextContainer? = nil) {
        super.init(frame: frame, textContainer: textContainer)
        
        textContainer?.lineFragmentPadding = 0
        
        delegate = self
        
        keyboardAppearance = UIKeyboardAppearance.dark
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeTextCenterVertically() {
        if !isTextCenterVertically { return }
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
        textContainerInset = padding
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        makeTextCenterVertically()
    }
    
    func getText() -> String { text }
    
    func onTextViewdDidBeginEditing() {}
}

extension BaseTextView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        onTextViewdDidBeginEditing()
        onDidBeginEditing?(self)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        onDidEndEditing?(self)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        onTextViewDidChange?(self)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return shouldChangeTextIn?(self, range, text) ?? true
    }
}
