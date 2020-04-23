//
//  PostCell.swift
//  EverybodyEats
//
//  Created by Jaheed Haynes on 4/21/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher

protocol PostCellDelegate: AnyObject {
    func didSelectUserHandle(_ itemCell: PostCell)
}

class PostCell: UICollectionViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var heartButtonOutlet: UIButton!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var userHandleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var datePostedLabel: UILabel!
    
    private var currentPost: Post!
   
    weak var delegate: PostCellDelegate?

    
    private lazy var tapGesture: UITapGestureRecognizer = {
       let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(handleTap(_:)))
        return gesture
    }()
    
    override func layoutSubviews() {
           super.layoutSubviews()
           
           userHandleLabel.textColor = .systemIndigo
           userHandleLabel.addGestureRecognizer(tapGesture)
           userHandleLabel.isUserInteractionEnabled = true
       }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer){
        // MARK: CD step 3
        delegate?.didSelectUserHandle(self)
    }
    
    private func configureCell(for post: Post) {
        currentPost = post
        updateUI(id: post.id, imageData: post.imageURL, caption: post.caption, createdDate: post.createdDate, userHandle: post.userHandle)
    }
    
     private func updateUI(id: String, imageData: String,caption: String, createdDate: Date, userHandle: String){
           postImageView.kf.setImage(with: URL(string:imageData))
           userHandleLabel.text = "@\(userHandle)"
           datePostedLabel.text = createdDate.dateString()
           captionLabel.text = caption
       }

    
    
}
