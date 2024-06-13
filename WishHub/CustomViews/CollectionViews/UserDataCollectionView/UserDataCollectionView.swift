//
//  UserDataCollectionView.swift
//  WishHub
//
//  Created by Мявкo on 10.06.24.
//

import UIKit

class UserDataCollectionView: UICollectionView {

    // MARK: UI elements
    private var customLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return layout
    }()

    // MARK: Properties
    let userDataItems = UserDataItem.allCases

    // MARK: Init
    init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame, collectionViewLayout: customLayout)
        setupAppearance()
        setupCollectionView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Setup cells
    private func setupCollectionView() {
        dataSource = self
        delegate = self
        register(UserDataCollectionViewCell.self, forCellWithReuseIdentifier: UserDataCollectionViewCell.className)
    }

    // MARK: Setup appearance
    private func setupAppearance() {
        layer.cornerRadius = 16
        backgroundColor = .clear
        isScrollEnabled = false
    }
}

// MARK: - UICollectionViewDataSource

extension UserDataCollectionView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userDataItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserDataCollectionViewCell.className, for: indexPath) as? UserDataCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        cell.userData = userDataItems[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension UserDataCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width / CGFloat(userDataItems.count)
        return CGSize(width: itemWidth, height: 70)
    }
}
