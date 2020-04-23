//
//  EventFeedView.swift
//  EverybodyEats
//
//  Created by Chelsi Christmas on 4/22/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class EventFeedView: UIView {
    
    
    public lazy var allergenCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    public lazy var eventCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .orange
        return cv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = .systemRed
        setUpAllergenCVConstraints()
        setupEventCVConstraints()
        
        
    }
    
    private func setUpAllergenCVConstraints() {
        addSubview(allergenCollectionView)
               allergenCollectionView.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                allergenCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor), allergenCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor), allergenCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                allergenCollectionView.heightAnchor.constraint(equalToConstant: frame.height / 10)
               ])
    }
    
    private func setupEventCVConstraints() {
        addSubview(eventCollectionView)
        eventCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventCollectionView.topAnchor.constraint(equalTo: allergenCollectionView.bottomAnchor), eventCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            eventCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            eventCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

