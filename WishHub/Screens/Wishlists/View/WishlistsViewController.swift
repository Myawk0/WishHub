//
//  WishlistsViewController.swift
//  WishHub
//
//  Created by Мявкo on 14.06.24.
//

import Foundation
import UIKit

class WishlistsViewController: BaseViewController {
    
    // MARK: - архитектура
    var localization: WishlistsLocalization!
    var presenter: WishlistsViewOutput!

    // MARK: - структуры и перечисления

    // MARK: - элементы UI

    // MARK: - переменные

    // MARK: - жизненный цикл контроллера
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - настройка UI
    func setupUI() {
        addSubviews()
        makeConstraints()
    }
    
    func addSubviews() {

    }

    func makeConstraints() {

    }
    
    // MARK: - методы и функции
}
