//
//  EventCell.swift
//  MockUp-Everybody-Eats
//
//  Created by Chelsi Christmas on 4/21/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {
    
    
    
    public lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.image = UIImage(systemName: "photo")
        return image
    }()
    
    public lazy var eventTitleLabel: UILabel = {
      let label = UILabel()
        return label
    }()
    
    public lazy var dateLabel: UILabel = {
         let label = UILabel()
           return label
       }()
    
    public lazy var timeLabel: UILabel = {
         let label = UILabel()
           return label
       }()
    
    public lazy var favoriteButton: UIButton = {
         let button = UIButton()
        // button Image - unfilled heart
        
           return button
       }()
    
    
   
    
    private func commonInit() {
    setupImageView()
        setupFavoriteButton()
        setupDateLabel()
        setupTimeLabel()
        
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([])
    }
    private func setupFavoriteButton() {
        addSubview(favoriteButton)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([])
    }
    private func setupEventTitleLabel() {
        addSubview(eventTitleLabel)
        eventTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([])
    }
    
    private func setupDateLabel() {
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([])
    }
    private func setupTimeLabel() {
        addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([])
    }
    
    
    
    
}
