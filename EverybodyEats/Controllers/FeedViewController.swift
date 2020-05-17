//
//  ViewController.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import FirebaseFirestore

class FeedViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let databaseService = PostDatabaseService.helper
    
    private var listener: ListenerRegistration?
    
    private var refreshControl: UIRefreshControl!
    
    var usersPosts = [Post](){
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        addNavBarImage()
    }
    
    private func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    private func loadData() {
        PostDatabaseService.helper.getPosts { [weak self] result in
            switch result {
            case .failure(let error):
                self?.showAlert(title: "Error", message: error.localizedDescription)
            case .success(let posts):
                self?.usersPosts = posts
            }
        }
    }
    
    
    //---------------------------
    public func addNavBarImage(){
        let navController = navigationController!
        
        let image = #imageLiteral(resourceName: "navImage")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - image.size.width / 2
        let bannerY = bannerHeight / 2 - image.size.height / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    //---------------------------
    
}

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        usersPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as? PostCell else {
            fatalError("error")
        }
        cell.delegate = self
        cell.configureCell(for: usersPosts[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let interItemSpacing: CGFloat = 10 // space between items
        
        let maxWidth = UIScreen.main.bounds.size.width // devices width
        
        let numberOfItems: CGFloat = 1 // items
        
        let totalSpacing: CGFloat = numberOfItems * interItemSpacing
        
//        let itemWidth: CGFloat = (maxWidth - totalSpacing) / numberOfItems
        let itemWidth: CGFloat = maxWidth
        return CGSize(width: itemWidth, height: itemWidth)
        
        
    }
    
}

extension FeedViewController: PostCellDelegate {
    func didPressHeartButton(_ button: UIButton, post: Post) {
        if button.image(for: .normal) == UIImage(systemName: "heart.fill") {
            button.setImage(UIImage(systemName: "heart"), for: .normal)
            PostDatabaseService.helper.unfavoritePost(userID: User.jaheed.id, postID: post.id) { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.showAlert(title: "Error", message: error.localizedDescription)
                case .success:
                    break
                }
            }
        } else {
            button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            PostDatabaseService.helper.favoritePost(userID: User.jaheed.id, post: post) { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.showAlert(title: "Error", message: error.localizedDescription)
                case .success:
                    break
                }
            }
        }
    }
    
    func didSelectUserHandle(_ itemCell: PostCell, post: Post) {
        present(ProfileViewController(userId: post.userId), animated: true, completion: nil)
    }
    
    
}



