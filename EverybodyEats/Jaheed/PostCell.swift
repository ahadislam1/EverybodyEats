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
    func didSelectUserHandle(_ itemCell: PostCell, post: Post)
    func didPressHeartButton(_ button: UIButton, post: Post)
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
    
    @IBAction func heartButtonPressed(_ sender: UIButton) {
        delegate?.didPressHeartButton(sender, post: currentPost)
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        delegate?.didSelectUserHandle(self, post: currentPost)
    }
    
    public func configureCell(for post: Post) {
        currentPost = post
        updateUI(id: post.id, imageURL: post.imageURL, caption: post.caption, createdDate: post.createdDate, userHandle: post.userHandle, like: post.like)
    }
    
    private func updateUI(id: String, imageURL: String,caption: String, createdDate: Date, userHandle: String, like: Like){
        
        postImageView.kf.indicatorType = .activity
        postImageView.kf.setImage(with: URL(string: imageURL))
        userHandleLabel.text = "@\(userHandle)"
        likesCountLabel.text = "\(Int.random(in: 1...1202040))"
        datePostedLabel.text = createdDate.dateString()
        captionLabel.text = caption
    }
    
    
    
}
