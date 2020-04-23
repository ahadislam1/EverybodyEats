//
//  CreateEventViewController.swift
//  EverybodyEats
//
//  Created by Chelsi Christmas on 4/22/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
    
    let createEventView = CreateEventView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        
    }
    override func loadView() {
        view = createEventView
    }
    

   

}
