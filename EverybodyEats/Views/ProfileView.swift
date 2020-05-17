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
    func didPressEditButton()
}

class ProfileView: UIView {
    public lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.kf.indicatorType = .activity
        iv.backgroundColor = .systemBackground
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "person.circle")
        return iv
    }()
    
    public lazy var button: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(systemName: "plus"), for: .normal)
        b.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        b.backgroundColor = .systemBackground
        return b
    }()
    
    public lazy var editProfileButton: UIButton = {
        let b = UIButton()
        b.setTitle("Edit Profile", for: .normal)
        b.setTitleColor(.systemBlue, for: .normal)
        b.setTitleColor(.systemBackground, for: .highlighted)
        b.addTarget(self, action: #selector(profileButtonPressed), for: .touchUpInside)
        return b
    }()
    
    private lazy var cardView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: "#9EECC1") ?? UIColor.systemGreen
        return v
    }()
    
    private lazy var titleLabel: UILabel = {
       let l = UILabel()
        l.text = "City"
        l.font = UIFont.preferredFont(forTextStyle: .headline).withSize(36)
        return l
    }()
    
    public lazy var displayLabel: UILabel = {
        let l = UILabel()
        l.text = "Display Name"
        l.textAlignment = .center
        l.font = UIFont.preferredFont(forTextStyle: .largeTitle).withSize(24)
        return l
    }()
    
    public lazy var cityLabel: UILabel = {
        let l = UILabel()
        l.text = "NYC"
        l.textAlignment = .right
        l.font = l.font.withSize(24)
        return l
    }()
    
    private lazy var bioTitleLabel: UILabel = {
        let l = UILabel()
        l.text = "Bio"
        l.font = UIFont.preferredFont(forTextStyle: .headline).withSize(36)
        return l
    }()
    
    public lazy var bioTextView: UITextView = {
        let tv = UITextView()
        tv.text = "iOS Developer, Peanut Allergenner.. or something."
        tv.font = UIFont.preferredFont(forTextStyle: .body).withSize(18)
        tv.backgroundColor = .clear
        tv.isEditable = false
        tv.isSelectable = false
        return tv
    }()
    
    private lazy var allergenTitleLabel: UILabel = {
        let l = UILabel()
        l.text = "Allergy"
        l.font = UIFont.preferredFont(forTextStyle: .headline).withSize(36)
        return l
    }()
    
    public lazy var allergenLabel: UILabel = {
        let l = UILabel()
        l.text = "allergy"
        l.textAlignment = .right
        l.font = l.font.withSize(24)
        return l
    }()
    
    private lazy var eventsLabel: UILabel = {
        let l = UILabel()
        l.text = "Events"
        l.font = UIFont.preferredFont(forTextStyle: .headline).withSize(36)
        return l
    }()
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(EventCell.self, forCellWithReuseIdentifier: "eventCell")
        cv.backgroundColor = .clear
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
        configureEditButtonLayer()
    }
    
    @objc
    private func buttonPressed() {
        delegate?.didPressButton()
    }
    
    @objc
    private func profileButtonPressed() {
        delegate?.didPressEditButton()
    }
    
    fileprivate func configureImageLayer() {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.label.cgColor
    }
    
    fileprivate func configureCardLayer() {
        cardView.layer.cornerRadius = 12
    }
    
    fileprivate func configureButtonLayer() {
        button.layer.masksToBounds = true
        button.layer.cornerRadius = button.bounds.width / 2
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    fileprivate func configureEditButtonLayer() {
        editProfileButton.layer.masksToBounds = true
        editProfileButton.layer.cornerRadius = 12
        editProfileButton.layer.borderWidth = 2
        editProfileButton.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    private func configureView() {
        setupCardView()
        setupImageView()
        setupDisplayLabel()
        setupTitleLabel()
        setupCityLabel()
        setupBioTitleLabel()
        setupBioTextView()
        setupAllergenTitleLabel()
        setupAllergenLabel()
        setupEventsLabel()
        setupCollectionView()
        setupButton()
        setupEditProfileButton()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: cardView.topAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            imageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15)])
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
            displayLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            displayLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            displayLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8)])
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
            cityLabel.trailingAnchor.constraint(equalTo: cardView.centerXAnchor)])
    }
    
    private func setupBioTitleLabel() {
        cardView.addSubview(bioTitleLabel)
        bioTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bioTitleLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor),
            bioTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bioTitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8)])
    }
    
    private func setupBioTextView() {
        cardView.addSubview(bioTextView)
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bioTextView.topAnchor.constraint(equalTo: bioTitleLabel.bottomAnchor, constant: 5),
            bioTextView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            bioTextView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
            bioTextView.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 1 / 6)])
    }
    
    private func setupAllergenTitleLabel() {
        cardView.addSubview(allergenTitleLabel)
        allergenTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            allergenTitleLabel.topAnchor.constraint(equalTo: bioTextView.bottomAnchor, constant: 5),
            allergenTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            allergenTitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8)])
    }
    
    private func setupAllergenLabel() {
        cardView.addSubview(allergenLabel)
        allergenLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            allergenLabel.topAnchor.constraint(equalTo: allergenTitleLabel.bottomAnchor),
            allergenLabel.leadingAnchor.constraint(equalTo: allergenTitleLabel.leadingAnchor),
            allergenLabel.trailingAnchor.constraint(equalTo: cityLabel.trailingAnchor)])
    }
    
    private func setupEventsLabel() {
        cardView.addSubview(eventsLabel)
        eventsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventsLabel.topAnchor.constraint(equalTo: allergenLabel.bottomAnchor),
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
            button.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            button.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            button.widthAnchor.constraint(equalToConstant: 30),
            button.heightAnchor.constraint(equalToConstant: 30)])
    }
    
    private func setupEditProfileButton() {
        addSubview(editProfileButton)
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editProfileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            editProfileButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            editProfileButton.widthAnchor.constraint(equalToConstant: editProfileButton.intrinsicContentSize.width + 5)])
    }
    
    
}
