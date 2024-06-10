//
//  ApplicationsPageViewController.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import Foundation
import UIKit

class ApplicationsPageViewController: BaseViewController {
    

    //MARK: - архитектура
    var localization: ApplicationsPageLocalization!
    var presenter: ApplicationsPageViewOutput!


    //MARK: - структуры и перечисления


    //MARK: - элементы UI
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Заявок нет, но вы держитесь"
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
