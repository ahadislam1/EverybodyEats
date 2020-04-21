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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view = favoriteView
        favoriteView.collectionView.dataSource = self
        favoriteView.collectionView.delegate = self
        favoriteView.collectionView.register(ItemCell.self, forCellWithReuseIdentifier: "itemCell")
    }


}

extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ItemCell else {
            fatalError("Could not downcast to item cell")
        }
        return cell
    }
    
    
}

extension FavoriteViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}
