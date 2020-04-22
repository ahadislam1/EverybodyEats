//
//  FavoriteViewController.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

enum ViewState {
    case posts
    case events
    
}

class FavoriteViewController: UIViewController {
    
    let favoriteView = FavoriteView()
    let posts = [Post]()
    let events = [Event]()
    
    var currentViewState: ViewState = .posts {
        didSet {
            favoriteView.collectionView.reloadData()
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

    @objc
    func presentDetails () {
        //TODO: Present a Detail View Controller.
    }
    }


extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch currentViewState {
        case .posts:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postFavoriteCell", for: indexPath) as? PostFavoriteCell else {
                fatalError("Could not downcast to postFavoriteCell")
            }
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
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.6)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

    
    
}
