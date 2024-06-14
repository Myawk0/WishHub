//
//  BaseCollectionView.swift
//  iOSDepartment
//
//  Created by Александр Строев on 29.08.2021.
//  Copyright © 2021 Stroev. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView {
    
    var isAutoDimensionHeight: Bool = false
    
    var sizeForItemAt: ((BaseCollectionView, UICollectionViewLayout, IndexPath) -> CGSize)?
    var referenceSizeForHeaderInSection: ((BaseCollectionView, UICollectionViewLayout, Int) -> CGSize)?
    var numberOfItemsInSection: ((BaseCollectionView, Int) -> Int)?
    var countOfSections: ((BaseCollectionView) -> Int)?
    var cellForItemAt: ((BaseCollectionView, IndexPath) -> UICollectionViewCell)?
    var willDisplay: [(BaseCollectionView, UICollectionViewCell, IndexPath) -> Void] = []
    var didSelectItemAt: ((BaseCollectionView, IndexPath) -> Void)?
    var insetForSection: ((BaseCollectionView, UICollectionViewLayout, Int) -> UIEdgeInsets)?
    var minimumLineSpacingForSectionAt: ((BaseCollectionView, UICollectionViewLayout, Int) -> CGFloat)?
    var viewForSupplementaryElementOfKind: ((String, IndexPath) -> BaseCollectionCell)?
    
    override var contentSize: CGSize {
        didSet {
            guard isAutoDimensionHeight else { return }
            invalidateIntrinsicContentSize()
            updateLayoutRecursively()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        guard isAutoDimensionHeight else { return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric) }
        updateLayoutRecursively()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
    
    init(frame: CGRect = CGRect.zero, layout: UICollectionViewCompositionalLayout, cellsForRegistration: [BaseCollectionCell.Type] = []) {
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        
        cellsForRegistration.forEach { register($0) }
        
        reloadData()
    }
    
    init(frame: CGRect = CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout? = nil, cellsForRegistration: [BaseCollectionCell.Type] = []) {
        
        var layout: UICollectionViewFlowLayout!
        
        if let collectionViewLayout {
            layout = collectionViewLayout
        } else {
            layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 0
        }
        
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        
        cellsForRegistration.forEach { register($0) }
        reloadData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func register<HeaderFooter: UITableViewHeaderFooterView>(headerFooter type: HeaderFooter.Type) {
        register(type, forCellWithReuseIdentifier: type.className)
    }

    func registerNib<HeaderFooter: UITableViewHeaderFooterView>(headerFooter type: HeaderFooter.Type) {
        register(UINib(nibName: type.className, bundle: nil), forCellWithReuseIdentifier: type.className)
    }

    func dequeue<Cell: UICollectionViewCell>(_ cell: Cell.Type, for row: Int, in section: Int = 0) -> Cell {
        return dequeue(cell, for: IndexPath(row: row, section: section))
    }
    
    func getHeightOfCell(at indexPath: IndexPath) -> CGFloat {
        return cellForItemAt?(self, indexPath).frame.height ?? 0
    }
    
}

extension BaseCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return sizeForItemAt?(self, collectionViewLayout, indexPath) ??
        CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height / 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return referenceSizeForHeaderInSection?(self, collectionViewLayout, section) ?? CGSize(width: collectionView.frame.width, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        willDisplay.forEach { closure in
            closure(self, (cell as? BaseCollectionCell) ?? BaseCollectionCell(), indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItemAt?(self, indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insetForSection?(self, collectionViewLayout, section) ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacingForSectionAt?(self, collectionViewLayout, section) ?? 0
    }
}

// MARK: - UICollectionViewDataSource

extension BaseCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInSection?(self, section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return cellForItemAt?(self, indexPath) ?? UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return countOfSections?(self) ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if viewForSupplementaryElementOfKind?(kind, indexPath) != nil {
            return viewForSupplementaryElementOfKind!(kind, indexPath)
        } else {
            registerHeader(BaseCollectionCell.self)
            return dequeueHeader(BaseCollectionCell.self, kind: kind, for: indexPath)
        }
    }
}

extension UICollectionView {
    
    func registerNib(_ cellType: UICollectionViewCell.Type) {
        register(UINib(nibName: cellType.className, bundle: nil), forCellWithReuseIdentifier: cellType.className)
    }

    func register<Cell: UICollectionViewCell>(_ type: Cell.Type) {
        register(type, forCellWithReuseIdentifier: type.className)
    }
    
    func registerHeader<Header: UICollectionReusableView>(_ type: Header.Type) {
        register(type, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.className)
    }

    func dequeue<Cell: UICollectionViewCell>(_ cell: Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: Cell.className, for: indexPath) as? Cell else { return Cell() }
        return cell
    }

    func dequeue<Cell: UICollectionViewCell>(_ cell: Cell.Type, for row: Int) -> Cell {
        return dequeue(cell, for: IndexPath(row: row, section: 0))
    }
    
    func dequeueHeader<Header: UICollectionReusableView>(_ cell: Header.Type, kind: String, for indexPath: IndexPath) -> Header {
        return (dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.className, for: indexPath) as? Header) ?? Header()
    }
    
    var fullyVisibleCells: [UICollectionViewCell] {
        return self.visibleCells.filter { cell in
            let cellRect = self.convert(cell.frame, to: self.superview)
            return self.frame.contains(cellRect) }
    }
}
