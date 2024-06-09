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


    //MARK: - переменные


    //MARK: - жизненный цикл контроллера
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        view.backgroundColor = .systemPink
    }


    //MARK: - настройка UI
    func setupUI() {
        addSubviews()
        makeConstraints()
    }
    
    func addSubviews() {

    }

    func makeConstraints() {

    }
    
    //MARK: - методы и функции
}
