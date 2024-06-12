//
//  ProfileViewController.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation
import UIKit

class ProfileViewController: BaseViewController {
    

    //MARK: - архитектура
    var localization: ProfileLocalization!
    var presenter: ProfileViewOutput!


    //MARK: - структуры и перечисления
    struct ProfileData {
        
    }


    //MARK: - элементы UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = localization.profileTitle
        label.font = Fonts.Title.h3
        label.textColor = .glossyGrape
        return label
    }()
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .americanSilver
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var cameraImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.ProfileItems.camera
        imageView.backgroundColor = .glossyGrape
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var userFirstLetterLabel: UILabel = {
        let label = UILabel()
        label.text = "M"
        label.font = Fonts.Title.h1
        label.textColor = .slateGray.withAlphaComponent(0.6)
        return label
    }()
    
    private lazy var userFullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя Фамилия"
        label.font = Fonts.Body.largeMedium
        label.textColor = .independence
        label.textAlignment = .center
        return label
    }()
    
    private lazy var userNicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "@myawko"
        label.font = Fonts.Label.medium
        label.textColor = .independence
        label.textAlignment = .center
        return label
    }()
    
    private lazy var userDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var userDataCollectionView: UserDataCollectionView = {
        let collectionView = UserDataCollectionView()
        return collectionView
    }()

    
    private lazy var menuTableView: ProfileTableView = {
        let tableView = ProfileTableView()
        return tableView
    }()


    //MARK: - переменные
    var profileData: ProfileData! {
        didSet {
 
        }
    }


    //MARK: - жизненный цикл контроллера
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupThemeSwitcher()
        presenter.viewDidLoaded()
    }

    //MARK: - настройка UI
    private func setupUI() {
        addSubviews()
        makeConstraints()
    }
    
    private func setupThemeSwitcher() {
        NotificationCenter.default.addObserver(forName: .switcherStateChanged, object: nil, queue: nil) { notification in
            if let isOn = notification.userInfo?["isOn"] as? Bool {
                UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = isOn ? .dark : .light
                
                let tabBar = self.tabBarController?.tabBar as? TabBar
                tabBar?.changeColors(isDarkTheme: isOn)
                
                self.presenter.themeModeSwitcherIsTapped(isOn: isOn)
            }
        }
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(userImageView)
        userImageView.addSubview(userFirstLetterLabel)
        view.addSubview(cameraImageView)
        view.addSubview(userFullNameLabel)
        view.addSubview(userNicknameLabel)
        view.addSubview(userDataCollectionView)
        view.addSubview(menuTableView)
    }

    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.centerX.equalToSuperview()
        }
        
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(120)
        }
        
        cameraImageView.snp.makeConstraints { make in
            make.trailing.equalTo(userImageView.snp.trailing)
            make.bottom.equalTo(userImageView.snp.bottom)
            make.height.width.equalTo(40)
        }
        
        userFirstLetterLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        userFullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        userNicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(userFullNameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        userDataCollectionView.snp.makeConstraints { make in
            make.top.equalTo(userNicknameLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(70)
        }
        
        menuTableView.snp.makeConstraints { make in
            make.top.equalTo(userDataCollectionView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(300)
        }
    }
    
    //MARK: - методы и функции
}
