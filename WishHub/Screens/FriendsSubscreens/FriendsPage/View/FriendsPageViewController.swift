//
//  FriendsPageViewController.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation
import UIKit

class FriendsPageViewController: BaseViewController {
    

    //MARK: - архитектура
    var localization: FriendsPageLocalization!
    var presenter: FriendsPageViewOutput!


    //MARK: - структуры и перечисления


    //MARK: - элементы UI
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Нет друзей? Давайте найдем"
        label.font = Fonts.Body.large
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
        view.addSubview(descriptionLabel)
    }

    func makeConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    //MARK: - методы и функции
}
