//
//  ProfileView.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    public lazy var viewImage: UIImageView = {
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
    
    private lazy var cityLabel: UIView = {
       let l = UILabel()
        l.text = "City"
        l.font = UIFont.preferredFont(forTextStyle: .headline).withSize(20)
        return l
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
        viewImage.layer.masksToBounds = true
        viewImage.layer.cornerRadius = 50
        print(viewImage.layer.cornerRadius)
        viewImage.layer.borderWidth = 2
        viewImage.layer.borderColor = UIColor.red.cgColor
    }
    
    fileprivate func configureCardLayer() {
        cardView.layer.cornerRadius = 12
    }
    
    private func configureView() {
        setupCardView()
        setupViewImage()
    }
    
    private func setupViewImage() {
        cardView.addSubview(viewImage)
        viewImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewImage.centerYAnchor.constraint(equalTo: cardView.topAnchor),
            viewImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),
            viewImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25)])
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
    
    private func setupCityLabel() {
        addSubview(cityLabel)
        
    }
    
    
}
