//
//  ProfileView.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    public lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemOrange
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "person.circle")
        return iv
    }()
    
    private lazy var cardView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemPink
        return v
    }()
    
    private lazy var titleLabel: UIView = {
       let l = UILabel()
        l.text = "City"
        l.font = UIFont.preferredFont(forTextStyle: .headline).withSize(48)
        return l
    }()
    
    private lazy var cityLabel: UILabel = {
        let l = UILabel()
        l.text = "NYC"
        l.textAlignment = .center
        l.font = l.font.withSize(24)
        return l
    }()
    
    private lazy var eventsLabel: UILabel = {
        let l = UILabel()
        l.text = "Events"
        l.font = UIFont.preferredFont(forTextStyle: .headline).withSize(48)
        return l
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemGroupedBackground
        return cv
    }()
    
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureCardLayer()
        configureImageLayer()
    }
    
    fileprivate func configureImageLayer() {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        print(imageView.layer.cornerRadius)
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.red.cgColor
    }
    
    fileprivate func configureCardLayer() {
        cardView.layer.cornerRadius = 12
    }
    
    private func configureView() {
        setupCardView()
        setupViewImage()
        setupTitleLabel()
        setupCityLabel()
        setupEventsLabel()
        setupCollectionView()
    }
    
    private func setupViewImage() {
        cardView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: cardView.topAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),
            imageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25)])
    }
    
    private func setupCardView() {
        addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            cardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.69),
            cardView.widthAnchor.constraint(equalTo: widthAnchor, constant: -40)])
    }
    
    private func setupTitleLabel() {
        cardView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8)])
    }
    
    private func setupCityLabel() {
        cardView.addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)])
    }
    
    private func setupEventsLabel() {
        cardView.addSubview(eventsLabel)
        eventsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventsLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor),
            eventsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            eventsLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)])
    }
    
    private func setupCollectionView() {
        cardView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: eventsLabel.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: cityLabel.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: cityLabel.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8)])
    }
    
    
}
