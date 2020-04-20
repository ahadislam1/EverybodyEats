//
//  EventsCell.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        UIImage(systemName: "trash")
        return iv
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupImageView()
        
    }
    
    fileprivate func setupImageView() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 2 / 3),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 2 / 3)])
        
        print(imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 2 / 3).multiplier)
    }
    
    
}
