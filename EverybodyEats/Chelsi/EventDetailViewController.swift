//
//  EventDetailViewController.swift
//  EverybodyEats
//
//  Created by Chelsi Christmas on 4/22/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import MapKit
import FirebaseFirestore


class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var userHandleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var allergenLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    private var listener: ListenerRegistration?
    //private var databaseService = EventDataBaseService()
    private var event: Event
    
    private var isFavorite = false {
           didSet{
               if isFavorite {
                   navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart.fill")
               }else{
                   navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart")
               }
           }
       }
    
    init?(coder: NSCoder, event: Event) {
        self.event = event
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.event = Event(id: "", imageURL: "", description: "", userHandle: "", createdBy: "", userId: "", allergen: [])
        super.init(coder: coder)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
       // unregisterKeyboardNotifications()
    }
    
 
        
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    @IBAction func likeButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    

}


