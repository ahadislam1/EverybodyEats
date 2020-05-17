//
//  FavoriteView.swift
//  EverybodyEats
//
//  Created by Matthew Ramos on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

protocol FavoriteViewDelegate: AnyObject {
    func segmentedControlChanged()
}

class FavoriteView: UIView {
    
    public lazy var segmentedControl: UISegmentedControl = {
        let segmentItems = ["Posts", "Events"]
        let sc = UISegmentedControl(items: segmentItems)
        sc.backgroundColor = .systemGreen
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
        return sc
    }()
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemGreen
        return cv
    }()
    
    public weak var delegate: FavoriteViewDelegate?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupSegmentedControl()
        setupCollectionView()
    }
    
    @objc
    func segmentedControlChanged() {
        delegate?.segmentedControlChanged()
       }
    
    private func setupSegmentedControl() {
        addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
    }
}
