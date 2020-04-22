//
//  PostCell.swift
//  EverybodyEats
//
//  Created by Jaheed Haynes on 4/21/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import Firebase
//import Kingfisher

class PostCell: UICollectionViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var heartButtonOutlet: UIButton!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var userHandleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var datePostedLabel: UILabel!
    
    private var currentPost: Post!
   
    
//    private lazy var tapGesture: UITapGestureRecognizer = {
//       let gesture = UITapGestureRecognizer()
//        gesture.addTarget(self, action: #selector(handleTap(_:)))
//        return gesture
//    }()
    
    private func configureCell(for post: Post) {
        currentPost = post
    }
    
    private func updateUI(){
        //postImage.kf.setImage(with: URL(string:imageURL))
       
    }

    
    
}



/*
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
       setUpLikeButton()
       setUpUserHandle()
       setUpUserCaption()
       
       
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
*/
