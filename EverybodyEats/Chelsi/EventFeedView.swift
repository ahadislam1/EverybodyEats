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
       let cv = UICollectionView()
        return cv
    }()
    
    public lazy var eventCollectionView: UICollectionView = {
    let cv = UICollectionView()
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
        setupEventCVConstraints()
        setupEventCVConstraints()
        
    }
    
    private func setUpAllergenCVConstraints() {
        
    }
    
    private func setupEventCVConstraints() {
        
    }
}

