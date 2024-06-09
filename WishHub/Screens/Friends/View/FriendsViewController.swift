//
//  FriendsViewController.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

class FriendsViewController: BaseViewController {
    

    //MARK: - архитектура
    var localization: FriendsLocalization!
    var presenter: FriendsViewOutput!


    //MARK: - структуры и перечисления


    //MARK: - элементы UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = localization.friendsText
        label.font = Fonts.Title.h1
        label.textColor = .slateGray
        return label
    }()


    //MARK: - переменные


    //MARK: - жизненный цикл контроллера
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    //MARK: - настройка UI
    func setupUI() {
        addSubviews()
        makeConstraints()
    }
    
    func addSubviews() {
        view.addSubview(titleLabel)
    }

    func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: - методы и функции
}
