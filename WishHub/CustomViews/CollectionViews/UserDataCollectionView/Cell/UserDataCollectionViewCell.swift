//
//  UserDataCollectionViewCell.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import UIKit

enum UserDataItem: CaseIterable {
    case presents
    case friends
    case subscribers
    
    var title: String {
        switch self {
            case .presents:
                return "Подарки"
            case .friends:
                return "Друзья"
            case .subscribers:
                return "Подписчики"
        }
    }
}

class UserDataCollectionViewCell: UICollectionViewCell {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        return stackView
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.large
        label.text = "0"
        label.textColor = .ghostWhite
        label.textAlignment = .center
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Body.medium
        label.textColor = .ghostWhite
        label.textAlignment = .center
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .ghostWhite.withAlphaComponent(0.7)
        return view
    }()
    
    var userData: UserDataItem! {
        didSet {
            titleLabel.text = userData.title
            separatorView.isHidden = userData == .subscribers
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        contentView.backgroundColor = .darkPastelPurple
    }
    
    private func addSubviews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(countLabel)
        stackView.addArrangedSubview(titleLabel)
        contentView.addSubview(separatorView)
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.width.equalTo(1)
            make.top.bottom.equalToSuperview().inset(10)
        }
    }
}
