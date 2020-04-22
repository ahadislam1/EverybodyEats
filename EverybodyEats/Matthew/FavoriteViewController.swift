//
//  FavoriteViewController.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    let favoriteView = FavoriteView()
    let events = [Event]()
    let post = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteView.collectionView.dataSource = self
        favoriteView.collectionView.delegate = self
        favoriteView.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "itemCell")
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ItemCell else {
            fatalError("Could not downcast to item cell")
        }
        cell.detailButton.addTarget(self, action: #selector(presentDetails), for: .touchUpInside)
        return cell
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
