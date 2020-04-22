//
//  FeedView.swift
//  EverybodyEats
//
//  Created by Jaheed Haynes on 4/21/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//




/*
 
import UIKit

class FeedView: UIView {
    
    public lazy var collectionView: UICollectionView =    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(PostCell.self, forCellWithReuseIdentifier: "postCell")
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    
    
    public lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "person")
        return imageView
    }()
    
    public lazy var heartButton: UIButton = {
        let heartButton = UIButton()
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.addTarget(self, action: #selector(handleLike), for: .touchUpInside)
       return heartButton
    }()
    
    @objc private func handleLike(){
        print("like pressed")
    }
    
    public lazy var userHandle: UILabel = {
        let userHandle = UILabel()
        userHandle.text = "User"
        userHandle.font = UIFont(name: "Arial", size: 12.0)
        return userHandle
    }()
    
    public lazy var userCaption: UILabel = {
    let userHandle = UILabel()
    userHandle.text = "Caption"
    userHandle.font = UIFont(name: "Arial", size: 12.0)
    return userHandle
     }()
    
   
    
    init() {
        super.init(frame: .zero)
       commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    private func commonInit(){
        setupImageView()
        setUpHeartButton()
        setUpUserHandle()
        setUpUserCaption()
        
    }
    
    private func setupImageView(){
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    private func setUpHeartButton(){
        addSubview(heartButton)
        
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func setUpUserHandle(){
        addSubview(userHandle)
        
        userHandle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func setUpUserCaption(){
        addSubview(heartButton)
        
        userCaption.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        ])
    }
    
    
    
 }
 
 */
