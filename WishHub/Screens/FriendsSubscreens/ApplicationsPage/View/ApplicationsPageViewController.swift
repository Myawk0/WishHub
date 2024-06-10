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
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.FriendsPages.applications
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Заявок нет, но вы держитесь"
        label.font = Fonts.Body.large
        label.textColor = .darkPastelPurple
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Давай подождем, пока не прилетит новая заявка"
        label.font = Fonts.Body.medium
        label.textColor = .slateGray
        label.numberOfLines = 0
        label.textAlignment = .center
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
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
    }

    private func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview().offset(15)
            make.height.equalTo(300)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: - методы и функции
}
