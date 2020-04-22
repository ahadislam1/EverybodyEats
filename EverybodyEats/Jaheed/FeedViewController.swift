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
    
     private let databaseService = PostDatabaseService()
    
     private var listener: ListenerRegistration?
    
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
    }
    
    private func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(true)
      listener = Firestore.firestore().collection(PostDatabaseService.userPostsCollection).addSnapshotListener({ [weak self] (snapshot, error) in
        if let error = error {
          DispatchQueue.main.async {
            self?.showAlert(title: "Try again later", message: "\(error.localizedDescription)")
          }
        } else if let snapshot = snapshot {
         // let posts = snapshot.documents.map { Post($0.data()) }
         // self?.usersPosts = posts
        }
      })
    }

}

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as? PostCell else {
            fatalError("error")
        }
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
    



