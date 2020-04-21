//
//  PostCell.swift
//  EverybodyEats
//
//  Created by Jaheed Haynes on 4/21/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "person")
        return iv
    }()
    
    private lazy var likeButton: UIButton = {
        let lb = UIButton()
        lb.setImage(UIImage(systemName: "heart"), for: .normal)
        return lb
    }()
    
    private lazy var userHandle: UILabel = {
        let userHandle = UILabel()
        userHandle.text = "User"
        userHandle.font = UIFont(name: "Arial.bold", size: 13.0)
        return userHandle
    }()
    
    public lazy var userCaption: UILabel = {
    let userHandle = UILabel()
    userHandle.text = "Caption"
    userHandle.font = UIFont(name: "Arial", size: 12.0)
    return userHandle
     }()
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupImageView()
        cellSettings()
        
        
    }
    
    
    private func cellSettings(){
        layer.cornerRadius = 5
        layer.borderColor = UIColor.label.cgColor
        layer.borderWidth = 5
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor)])
    }
    
    private func setUpLikeButton(){
           addSubview(likeButton)
           
           likeButton.translatesAutoresizingMaskIntoConstraints = false
           
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
           addSubview(userCaption)
           
           userCaption.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               
           ])
       }
}
