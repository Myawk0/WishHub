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
  
        separatorStyle = .none
        isScrollEnabled = false
    }
}


// MARK: - UITableViewDataSource
extension ProfileTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.className, for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
      
        cell.menuItem = menuItems[indexPath.row]
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ProfileTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Selected row at index \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
