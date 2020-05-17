//
//  AllergenCell.swift
//  EverybodyEats
//
//  Created by Chelsi Christmas on 4/22/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class AllergenCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var allergenLabel: UILabel!
    
    let reuseId = "allergenCell"
    
    let allergenArray = [ "Milk", "Eggs","Fish","Shellfish","Tree Nuts","Peanuts","Wheat","Soy","Other"]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allergenArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath as IndexPath) as! AllergenCell
        
        
        cell.allergenLabel.text = self.allergenArray[indexPath.item]
        cell.backgroundColor = UIColor.cyan
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
}


