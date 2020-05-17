//
//  FavoriteViewController.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import FirebaseFirestore

enum ViewState {
    case posts
    case events
    
}

class FavoriteViewController: UIViewController {
    
    private let favoriteView = FavoriteView()
    private var posts = [Post]() {
        didSet {
            self.favoriteView.collectionView.reloadData()
        }
    }
    private var events = [Event]() {
        didSet {
            self.favoriteView.collectionView.reloadData()
        }
    }
    private var favoritesListener: ListenerRegistration?
    
    var currentViewState: ViewState = .posts {
        didSet {
            getFavorites()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteView.collectionView.dataSource = self
        favoriteView.collectionView.delegate = self
        favoriteView.delegate = self
        favoriteView.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "itemCell")
        favoriteView.collectionView.register(UINib(nibName: "PostFavoriteCell", bundle: nil), forCellWithReuseIdentifier: "postFavoriteCell")
        favoriteView.backgroundColor = .systemGreen
        view = favoriteView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getFavorites()
    }
    
    @objc
    func presentDetails () {
        //TODO: Present a Detail View Controller.
    }
    
    func getFavorites() {
        let user = User.jaheed
        var favoritesCollection = ""
        switch currentViewState {
        case .posts:
            favoritesCollection = PostDatabaseService.postsCollection
        case .events:
            favoritesCollection = PostDatabaseService.postsCollection
        }
        favoritesListener = Firestore.firestore().collection(PostDatabaseService.usersCollection)
            .document(user.id)
            .collection(favoritesCollection).addSnapshotListener( { [weak self] (snapshot, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self?.showAlert(title: "Error getting favorites", message: "\(error.localizedDescription)")
                    }
                } else if let snapshot = snapshot {
                    if self?.currentViewState == .posts {
                        let postData = snapshot.documents.map { $0.data()}
                        let posts = postData.map { Post($0)}
                        self?.posts = posts
                    } else {
                        let postData = snapshot.documents.map { $0.data()}
                        let posts = postData.map { Post($0)}
                        self?.posts = posts
                    }
                }
            })
    }
}


extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch currentViewState {
        case .posts:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postFavoriteCell", for: indexPath) as? PostFavoriteCell else {
                fatalError("Could not downcast to postFavoriteCell")
            }
            let post = posts[indexPath.row]
            cell.configureCell(post: post)
            cell.delegate = self
            return cell
        case .events:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ItemCell else {
                fatalError("Could not downcast to itemCell")
            }
            cell.detailButton.addTarget(self, action: #selector(presentDetails), for: .touchUpInside)
            return cell
        }
    }
    
    
}

extension FavoriteViewController: FavoriteViewDelegate {
    func segmentedControlChanged() {
        switch favoriteView.segmentedControl.selectedSegmentIndex {
        case 0:
            currentViewState = .posts
        case 1:
            currentViewState = .events
        default:
            currentViewState = .posts
        }
    }
    
    
}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.6)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    
    
}

extension FavoriteViewController: PostFavoriteCellDelegate {
    func didTapAllergy(cell: PostFavoriteCell, post: Post) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let unfavoriteAction = UIAlertAction(title: "Unfavorite", style: .destructive) { [weak self] (_) in
            PostDatabaseService.helper.unfavoritePost(userID: User.jaheed.id, postID: post.id) { result in
                switch result {
                case .failure(let error):
                    self?.showAlert(title: "Error", message: error.localizedDescription)
                case .success:
                    break
                }
            }
        }
        
        alertController.addAction(unfavoriteAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)    }
}
