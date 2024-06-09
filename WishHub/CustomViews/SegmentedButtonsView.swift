//
//  SegmentedButtonsView.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

class SegmentedButtonsView: UIView {
    
    // MARK: UI elements
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // MARK: Variables
    
    var buttonTitles: [String] = [] {
        didSet {
            setupButtons()
        }
    }
    
    var buttonIsTapped: ((Int) -> Void)?
    private var buttons: [SegmentedButton] = []
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: Setup UI
    
    private func setupUI() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupButtons() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        buttons.removeAll()
        
        for (index, title) in buttonTitles.enumerated() {
            let button = SegmentedButton()
            button.title = title
            button.tag = index
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            button.isSelected = index == 0
            buttons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        buttonIsTapped?(sender.tag)
        updateButtonColors(selectedIndex: sender.tag)
    }
    
    private func updateButtonColors(selectedIndex: Int) {
        buttons.enumerated().forEach { index, button in
            button.isSelected = index == selectedIndex
        }
    }
}

