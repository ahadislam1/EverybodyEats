//
//  EventViewController.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     configureCollectionView()
    }
    
    
    private let eventFeedView = EventFeedView()
        
        private var allergens = [String]()
        
        private var events = [String]() {
            didSet{
                DispatchQueue.main.async {
                    self.eventFeedView.eventCollectionView.reloadData()
                }
            }
        }
                
        
        override func loadView() {
            view = eventFeedView
        }
       
        
        
        private func configureCollectionView() {
            
            
            eventFeedView.eventCollectionView.register(UINib(nibName: "EventCell", bundle: nil), forCellWithReuseIdentifier: "eventCell")
            eventFeedView.eventCollectionView.dataSource = self
            eventFeedView.eventCollectionView.delegate = self
            eventFeedView.allergenCollectionView.dataSource = self
            
        }
        
        // function for liking an event
        
    }

    extension EventViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            allergens.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            if collectionView == eventFeedView.allergenCollectionView {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allergenCell", for: indexPath) as? AllergenCell else {
                    // needs to be of type Allergen Cell
                    fatalError("Unable to dequeue Allergy Cell")
                }
                let event = events[indexPath.row]
                //TODO: Configure Cell`
//                cell.configureCell(with: event)
                
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as? EventCell else {
                    fatalError("Unable to dequeue Event Cell")
                }
                let event = events[indexPath.row]
                //TODO: Configure Cell`
//                cell.configureCell(with: event)
                
                return cell
                
            }
            
            
            
        }
        
    }

    extension EventViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let maxSize: CGSize = UIScreen.main.bounds.size // max width and height of device
            let itemWidth: CGFloat = maxSize.width
            let itemHeight: CGFloat = maxSize.height * 0.40 // 40% of the height of the device
            return CGSize(width: itemWidth, height: itemHeight)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
    }
