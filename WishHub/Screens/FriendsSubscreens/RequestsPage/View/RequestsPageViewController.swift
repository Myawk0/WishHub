//
//  RequestsPageViewController.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation
import UIKit

class RequestsPageViewController: BaseViewController {
    

    //MARK: - архитектура
    var localization: RequestsPageLocalization!
    var presenter: RequestsPageViewOutput!


    //MARK: - структуры и перечисления


    //MARK: - элементы UI
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Запросы в процессе ожидания"
        label.font = Fonts.Label.large
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
