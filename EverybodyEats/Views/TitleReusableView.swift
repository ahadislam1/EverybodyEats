//
//  TitleReusableView.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class TitleReusableView: UICollectionReusableView {
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.preferredFont(forTextStyle: .headline).withSize(48)
        l.text = "Events"
        return l
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupTitleLabel()
    }
    
    fileprivate func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }
}
