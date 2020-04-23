//
//  AllergenCell.swift
//  EverybodyEats
//
//  Created by Chelsi Christmas on 4/22/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class AllergenCell: UICollectionViewCell {
    
    
    public lazy var allergyNameLabel: UILabel = {
       let label = UILabel()
        label.text = "hi"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    private func commonInit() {
        setupAllergyNameLabel()
    }
    
    private func setupAllergyNameLabel() {
        addSubview(allergyNameLabel)
        allergyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            allergyNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            allergyNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            allergyNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10)
        ])
    }
    
    public func configureCell(allergy: Allergen) {
        allergyNameLabel.text = allergy.rawValue
    }
    public func configureNameLabel() {
        
        allergyNameLabel.backgroundColor = .systemGray
    }
}
