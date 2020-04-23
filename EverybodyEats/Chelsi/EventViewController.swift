//
//  EventViewController.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

enum Allergen: String, CaseIterable {
    case milk = "Milk"
    case eggs = "Eggs"
    case fish = "Fish"
    case shellfish = "Shellfish"
    case treenuts = "Tree Nuts"
    case peanuts = "Peanuts"
    case wheat = "Wheat"
    case soy = "Soy"
}
class EventViewController: UIViewController {
    
    private let eventFeedView = EventFeedView()
    
    private var allergens = [Allergen](){
        didSet{
            DispatchQueue.main.async {
                self.eventFeedView.allergenCollectionView.reloadData()
            }
        }
    }
    
    private var events = [Event]() {
        didSet{
            DispatchQueue.main.async {
                self.eventFeedView.eventCollectionView.reloadData()
            }
        }
    }
    
    private lazy var createEventButton: UIBarButtonItem = {
        
        let button = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(createEventButtonPressed))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAllergenCollectionView()
        configureEventCollectionView()
        navigationItem.rightBarButtonItem = createEventButton
    }
    
    
    
    
    
    override func loadView() {
        view = eventFeedView
    }
    
    private func configureAllergenCollectionView() {
        
        eventFeedView.allergenCollectionView.register(AllergenCell.self, forCellWithReuseIdentifier: "allergenCell")
        eventFeedView.allergenCollectionView.dataSource = self
        eventFeedView.allergenCollectionView.delegate = self
        allergens = Allergen.allCases
        
    }
    
    private func configureEventCollectionView() {
        
        
        eventFeedView.eventCollectionView.register(EventCell.self, forCellWithReuseIdentifier: "eventCell")
        eventFeedView.eventCollectionView.dataSource = self
        eventFeedView.eventCollectionView.delegate = self
        
        
    }
    
    
    @objc func createEventButtonPressed() {
        // present the create event page
        let createEventVC = CreateEventViewController()
        present(createEventVC, animated: true, completion: nil)
        
    }
    
}

extension EventViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == eventFeedView.allergenCollectionView {
            return allergens.count
        } else {
            return events.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == eventFeedView.allergenCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allergenCell", for: indexPath) as? AllergenCell else {
                // needs to be of type Allergen Cell
                fatalError("Unable to dequeue Allergy Cell")
            }
            let allergen = allergens[indexPath.row]
            cell.configureCell(allergy: allergen)
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as? EventCell else {
                fatalError("Unable to dequeue Event Cell")
            }
            let event = events[indexPath.row]
            cell.configureCell(event: event)
            
            return cell
            
        }
        
        
        
    }
    
}

extension EventViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == eventFeedView.allergenCollectionView {
            let maxSize: CGSize = UIScreen.main.bounds.size // max width and height of device
            let itemWidth: CGFloat = maxSize.width * 0.3
            let itemHeight: CGFloat = maxSize.height * 0.09 // 40% of the height of the device
            return CGSize(width: itemWidth, height: itemHeight)
        } else {
            let maxSize: CGSize = UIScreen.main.bounds.size // max width and height of device
            let itemWidth: CGFloat = maxSize.width * 0.20
            let itemHeight: CGFloat = maxSize.height * 0.50 // 40% of the height of the device
            return CGSize(width: itemWidth, height: itemHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
