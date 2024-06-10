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


    //MARK: - элементы UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Профиль"
        label.font = Fonts.Title.h3
        label.textColor = .darkPastelPurple
        return label
    }()
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.image = .
        imageView.backgroundColor = .americanSilver
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var userFirstLetterLabel: UILabel = {
        let label = UILabel()
        label.text = "M"
        label.font = Fonts.Title.h1
        label.textColor = .darkPastelPurple
        return label
    }()
    
    private lazy var userFullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя Фамилия"
        label.font = Fonts.Body.large
        label.textColor = .slateGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var userNicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "@myawko"
        label.font = Fonts.Body.medium
        label.textColor = .slateGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tableView: ProfileTableView = {
        let tableView = ProfileTableView()
        return tableView
    }()


    //MARK: - переменные


    //MARK: - жизненный цикл контроллера
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    //MARK: - настройка UI
    private func setupUI() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(userImageView)
        userImageView.addSubview(userFirstLetterLabel)
        view.addSubview(userFullNameLabel)
        view.addSubview(userNicknameLabel)
        view.addSubview(tableView)
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
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(userNicknameLabel.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(200)
        }
    }
    
    //MARK: - методы и функции
}
