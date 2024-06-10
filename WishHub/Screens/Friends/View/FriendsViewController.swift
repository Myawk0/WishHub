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
        label.textColor = .darkPastelPurple
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = localization.findFriendsText
        label.font = Fonts.Label.large
        label.textColor = .slateGray
        return label
    }()
    
    private lazy var segmentedButtonsView: SegmentedButtonsView = {
        let view = SegmentedButtonsView()
        return view
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
        view.addSubview(segmentedButtonsView)
    }

    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        segmentedButtonsView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    
    //MARK: Methods
}
