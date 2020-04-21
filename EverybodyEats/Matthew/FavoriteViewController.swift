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
    }


}
