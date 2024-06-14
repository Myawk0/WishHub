//
//  UserDataCollectionCell.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import UIKit

class UserDataCollectionCell: BaseCollectionCell {
    
    // MARK: Structs and enums
    struct Data {
        let item: UserDataItem
        var value: Int
    }

    // MARK: UI elements
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        return stackView
    }()

    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Label.big
        label.textColor = .ghostWhite
        label.textAlignment = .center
        label.text = "123"
        return label
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Label.medium
        label.textColor = .ghostWhite
        label.textAlignment = .center
        return label
    }()

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .ghostWhite.withAlphaComponent(0.7)
        return view
    }()

    // MARK: Properties

    var data: Data! {
        didSet {
            countLabel.text = "\(data.value)"
            titleLabel.text = data.item.title
            separatorView.isHidden = data.item == .subscribers
        }
    }

    // MARK: Init
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup UI
    private func setupUI() {
        addSubviews()
        makeConstraints()
        setupAppearance()
    }

    private func setupAppearance() {
        contentView.backgroundColor = .glossyGrape
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
