//
//  CreateViewController.swift
//  EverybodyEats
//
//  Created by Jaheed Haynes on 4/23/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import FirebaseFirestore
import MapKit

class CreateEventViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var userHandle: UILabel!
    
    @IBOutlet weak var eventLocationTextField: UITextField!
    @IBOutlet weak var eventDateTextField: UITextField!
    @IBOutlet weak var eventTimeTextField: UITextField!
    @IBOutlet weak var allergenTextField: UITextField!
    
    @IBOutlet weak var mapLocation: MKMapView!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func postEvent(_ sender: UIButton) {
        
    }
    
  

}
