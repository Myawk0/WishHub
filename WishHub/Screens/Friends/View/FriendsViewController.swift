//
//  FriendsViewController.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

class FriendsViewController: BaseViewController {
    

    //MARK: Architecture
    var localization: FriendsLocalization!
    var presenter: FriendsViewOutput!


    //MARK: Structs and Enums


    //MARK: UI elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = localization.friendsText
        label.font = Fonts.Title.h1
        label.textColor = .slateGray
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = localization.findFriendsText
        label.font = Fonts.Label.large
        label.textColor = .slateGray
        return label
    }()


    //MARK: Variables


    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    //MARK: Setup UI
    private func setupUI() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
    }

    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    
    //MARK: Methods
}
