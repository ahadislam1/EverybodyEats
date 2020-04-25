//
//  PostFavoriteCell.swift
//  EverybodyEats
//
//  Created by Matthew Ramos on 4/22/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

protocol PostFavoriteCellDelegate: AnyObject {
    func didTapAllergy(cell: PostFavoriteCell, post: Post)
}

class PostFavoriteCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var datePostedLabel: UILabel!
    @IBOutlet weak var allergenIndicatorIV: UIImageView!
    @IBOutlet weak var allergenIndicatorIV2: UIImageView!
    @IBOutlet weak var allergenIndicatorIV3: UIImageView!
    
    weak var delegate: PostFavoriteCellDelegate?
    
    private var currentPost: Post!
    
    private lazy var gesture: UITapGestureRecognizer = {
        let g = UITapGestureRecognizer(target: self, action: #selector(allergyIconTapped))
        return g
    }()
    
    public func configureCell(post: Post) {
        currentPost = post
        allergenIndicatorIV.isUserInteractionEnabled = true
        allergenIndicatorIV.addGestureRecognizer(gesture)
        imageView.contentMode = .scaleAspectFill
        imageView.kf.setImage(with: URL(string: post.imageURL))
        likesLabel.text = String(post.like.count)
        userNameLabel.text = post.userHandle
        captionLabel.text = post.caption
        datePostedLabel.text = post.createdDate.dateString()
        switch post.allergen.count {
        case 1:
            allergenIndicatorIV.image = UIImage(named: post.allergen.first!)
        case 2:
            allergenIndicatorIV.image = UIImage(named: post.allergen.last!)
            allergenIndicatorIV2.image = UIImage(named: post.allergen.first!)
        case 3:
            allergenIndicatorIV.image = UIImage(named: post.allergen.last!)
            allergenIndicatorIV2.image = UIImage(named: post.allergen[2])
            allergenIndicatorIV3.image = UIImage(named: post.allergen.first!)
        default:
            allergenIndicatorIV.image = UIImage(named: "navImage")
        }
    }
    
    @objc
    private func allergyIconTapped() {
        delegate?.didTapAllergy(cell: self, post: currentPost)
    }
}
