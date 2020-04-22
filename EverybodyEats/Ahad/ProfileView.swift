//
//  ProfileView.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

protocol ProfileViewDelegate: AnyObject {
    func didPressButton()
}

class ProfileView: UIView {
    
    public lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemOrange
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "person.circle")
        return iv
    }()
    
    private lazy var button: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(systemName: "plus"), for: .normal)
        b.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        b.backgroundColor = .systemOrange
        return b
    }()
    
    private lazy var cardView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemPink
        return v
    }()
    
    private lazy var titleLabel: UILabel = {
       let l = UILabel()
        l.text = "City"
        l.font = UIFont.preferredFont(forTextStyle: .headline).withSize(48)
        return l
    }()
    
    private lazy var displayLabel: UILabel = {
        let l = UILabel()
        l.text = "Display Name"
        l.textAlignment = .center
        l.font = UIFont.preferredFont(forTextStyle: .largeTitle).withSize(36)
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
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemGroupedBackground
        cv.register(EventCell.self, forCellWithReuseIdentifier: "eventCell")
        return cv
    }()
    
    public weak var delegate: ProfileViewDelegate?
    
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
        configureButtonLayer()
    }
    
    @objc
    private func buttonPressed() {
        delegate?.didPressButton()
    }
    
    fileprivate func configureImageLayer() {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.red.cgColor
    }
    
    fileprivate func configureCardLayer() {
        cardView.layer.cornerRadius = 12
    }
    
    fileprivate func configureButtonLayer() {
        button.layer.masksToBounds = true
        button.layer.cornerRadius = button.bounds.width / 2
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
    }
    
    private func configureView() {
        setupCardView()
        setupImageView()
        setupDisplayLabel()
        setupTitleLabel()
        setupCityLabel()
        setupEventsLabel()
        setupCollectionView()
        setupButton()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: cardView.topAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.175),
            imageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.175)])
    }
    
    private func setupCardView() {
        addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            cardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            cardView.widthAnchor.constraint(equalTo: widthAnchor, constant: -40)])
    }
    
    private func setupDisplayLabel() {
        cardView.addSubview(displayLabel)
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            displayLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            displayLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            displayLabel.widthAnchor.constraint(equalToConstant: displayLabel.intrinsicContentSize.width)])
    }
    
    private func setupTitleLabel() {
        cardView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            titleLabel.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width)])
    }
    
    private func setupCityLabel() {
        cardView.addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8)])
    }
    
    private func setupEventsLabel() {
        cardView.addSubview(eventsLabel)
        eventsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventsLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor),
            eventsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            eventsLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8)])
    }
    
    private func setupCollectionView() {
        cardView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: eventsLabel.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: cityLabel.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: eventsLabel.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8)])
    }
    
    private func setupButton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            button.widthAnchor.constraint(equalToConstant: 30),
            button.heightAnchor.constraint(equalToConstant: 30)])
    }
    
    
}
