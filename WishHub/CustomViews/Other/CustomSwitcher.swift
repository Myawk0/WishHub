//
//  CustomSwitcher.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import UIKit

class CustomSwitcher: UIView {
    
    // MARK: UI elements
    private let switchBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 11
        return view
    }()
    
    private let switchThumbView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.addShadow(color: .slateGray, opacity: 0.3, radius: 2)
        return view
    }()
    
    
    // MARK: Properties
    var isOn: Bool = false {
        didSet {
            NotificationCenter.default.post(name: .switcherStateChanged, object: nil, userInfo: ["isOn": isOn])
        }
    }
    
    let onTintColor: UIColor = .glossyGrape
    let offTintColor: UIColor = .languidLavender
    let thumbTintColor: UIColor = .ghostWhite

    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: Setup UI
    private func setupUI() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        addSubview(switchBackgroundView)
        switchBackgroundView.addSubview(switchThumbView)
    }
    
    private func makeConstraints() {
        switchBackgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(22)
        }
        
        switchThumbView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(1)
        }
    }
    
    
    // MARK: Methods
    @objc private func handleTap() {
        isOn.toggle()
        updateSwitchState(animated: true)
    }
    
    func updateSwitchState(_ isOn: Bool, animated: Bool) {
        self.isOn = isOn
        updateSwitchState(animated: false)
    }
    
    func updateSwitchState(animated: Bool) {
        let backgroundColor: UIColor = isOn ? onTintColor : offTintColor
        let thumbPosition: CGFloat = isOn ? 19 : 1
        
        updateLayoutRecursively()
        if animated {
            UIView.animate(withDuration: 0.3) {
                self.switchBackgroundView.backgroundColor = backgroundColor
                self.switchThumbView.frame.origin.x = thumbPosition
            }
        } else {
            switchBackgroundView.backgroundColor = backgroundColor
            switchThumbView.frame.origin.x = thumbPosition
        }
    }
}
