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
        label.font = Fonts.Title.h1
        label.textColor = .darkPastelPurple
        return label
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
    }

    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: - методы и функции
}
