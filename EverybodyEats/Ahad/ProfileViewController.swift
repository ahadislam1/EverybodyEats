//
//  ProfileViewController.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileView = ProfileView()
    
    override func loadView() {
        view = profileView
    }
    
    let x: CGFloat = 2
    let y: CGFloat = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        print(x / y)
    }

}
