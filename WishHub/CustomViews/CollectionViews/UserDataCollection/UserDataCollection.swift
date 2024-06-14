//
//  UserDataCollection.swift
//  WishHub
//
//  Created by Мявкo on 14.06.24.
//

import UIKit

class UserDataCollection: BaseCollectionView {
    
    // MARK: UI elements
    private var customLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    // MARK: Properties
    var data: [UserDataCollectionCell.Data] = [] {
        didSet {
            reloadData()
        }
    }
    
    init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame, collectionViewLayout: customLayout)
        setupAppearance()
        setupItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup appearance
    private func setupAppearance() {
        layer.cornerRadius = 16
        backgroundColor = .clear
        isScrollEnabled = false
    }
    
    // MARK: Setup cells
    private func setupItems() {
        register(UserDataCollectionCell.self)
        
        cellForItemAt = { [weak self] _, indexPath in
            guard let self = self else { return BaseCollectionCell() }
            
            let cell: UserDataCollectionCell = self.dequeue(UserDataCollectionCell.self, for: indexPath)
            cell.data = self.data[indexPath.row]
            
            return cell
        }
        
        sizeForItemAt = { [weak self] collectionView, _, _ in
            guard let self = self else { return CGSize.zero }
            
            let itemWidth = collectionView.bounds.width / CGFloat(self.data.count)
            return CGSize(width: itemWidth, height: 70)
        }
        
        numberOfItemsInSection = { [weak self] _, _ in
            guard let self = self else { return 0 }
            
            return self.data.count
        }
    }
}
