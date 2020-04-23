//
//  PostFavoriteCell.swift
//  EverybodyEats
//
//  Created by Matthew Ramos on 4/22/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class PostFavoriteCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var datePostedLabel: UILabel!
    
    public func configureCell(post: Post) {
        likesLabel.text = String(post.like.count)
        userNameLabel.text = post.userHandle
        captionLabel.text = post.caption
        datePostedLabel.text = post.createdDate.dateString()
    }
}
