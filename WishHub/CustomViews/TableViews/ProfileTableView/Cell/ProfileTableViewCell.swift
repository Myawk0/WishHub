//
//  ProfileTableViewCell.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Label.big
        label.textColor = .independence
        label.textAlignment = .center
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .glossyGrape.withAlphaComponent(0.2)
        return view
    }()
    
    private lazy var modeSwitch: CustomSwitcher = {
        let switcher = CustomSwitcher()
        switcher.isHidden = true
        return switcher
    }()
    
    var menuItem: ProfileMenuItem! {
        didSet {
            titleLabel.text = menuItem.title
            modeSwitch.isHidden = menuItem != .mode
            if menuItem == .logout {
                iconImageView.image = menuItem.coloredIcon?.withTintColor(.mediumCarmine, renderingMode: .alwaysOriginal)
                titleLabel.textColor = .mediumCarmine.withAlphaComponent(0.8)
                separatorView.isHidden = true
            } else {
                iconImageView.image = menuItem.coloredIcon
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubviews()
        makeConstraints()
        setupAppearance()
    }
    
    private func setupAppearance() {
        contentView.backgroundColor = .ghostWhite
    }
    
    private func addSubviews() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(modeSwitch)
        contentView.addSubview(separatorView)
    }
    
    private func makeConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
        }
        
        modeSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.height.equalTo(22)
            make.width.equalTo(40)
            make.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).offset(20)
        }
        
        separatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(1)
        }
    }
}
