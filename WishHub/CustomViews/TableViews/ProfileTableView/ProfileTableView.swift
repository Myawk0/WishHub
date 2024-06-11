//
//  ProfileTableView.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import UIKit

class ProfileTableView: UITableView {
    
    let menuItems = ProfileMenuItem.allCases

    
    // MARK: - Init
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: Setup
    private func setupTableView() {
        delegate = self
        dataSource = self
    
        register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.className)
        layer.cornerRadius = 16
        
        sectionHeaderTopPadding = 0
        separatorStyle = .none
        isScrollEnabled = false
    }
}


// MARK: - UITableViewDataSource

extension ProfileTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? menuItems.count - 1 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.className, for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
      
        cell.menuItem = indexPath.section == 0 ? menuItems[indexPath.row] : menuItems.last
       
        return cell
    }
}


// MARK: - UITableViewDelegate

extension ProfileTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 100 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 1 else { return nil }
        
        let view = UIView()
        view.backgroundColor = .ghostWhite
        return view
    }
}
