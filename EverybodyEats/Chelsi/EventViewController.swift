//
//  EventViewController.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import FirebaseFirestore

class EventViewController: UIViewController {
    
    @IBOutlet weak var allergenCollectionView: UICollectionView!
    
    @IBOutlet weak var eventCollectionView: UICollectionView!
    
    private let databaseService = EventDataBaseService.helper
    
    private var listener: ListenerRegistration?
    
    private var refreshControl: UIRefreshControl!
    
    
    var allergens = [ "Milk", "Eggs","Fish","Shellfish","Tree Nuts","Peanuts","Wheat","Soy","Other"]
    
    var userEvents = [Event]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
    }
    
    
    
    private func configureCollectionView(){
        eventCollectionView.delegate = self
        eventCollectionView.dataSource = self
        
    }
    @IBAction func createEventButtonPressed(_ sender: UIBarButtonItem) {
        present(CreateEventViewController(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    private func loadData() {
        EventDataBaseService.helper.getEvents { [weak self] result in
            switch result {
            case .failure(let error):
                self?.showAlert(title: "Error", message: error.localizedDescription)
            case .success(let events):
                self?.userEvents = events
            }
        }
    }
    
    
    
}

extension EventViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == allergenCollectionView {
            return allergens.count
        } else {
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == allergenCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allergenCell", for: indexPath) as? AllergenCell else {
                // needs to be of type Allergen Cell
                fatalError("Unable to dequeue Allergy Cell")
            }
            let allergen = allergens[indexPath.row]
            
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as? EventCell else {
                fatalError("Unable to dequeue Event Cell")
            }
            //      let event = userEvents[indexPath.row]
            //        cell.configureCell(for: event)
            
            return cell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height / 3)
    }
    
}

//extension EventViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as? EventCell else {
//            fatalError("error")
//        }
//        //cell.delegate = self
//        //        cell.configureCell(for: usersEvents[indexPath.row])
//        return cell
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let interItemSpacing: CGFloat = 10 // space between items
//
//        let maxWidth = UIScreen.main.bounds.size.width // devices width
//
//        let numberOfItems: CGFloat = 1
//
//        let totalSpacing: CGFloat = numberOfItems * interItemSpacing
//
//        let itemWidth: CGFloat = maxWidth
//
//        return CGSize(width: itemWidth, height: itemWidth)
//
//
//    }
//
//}
//
//
