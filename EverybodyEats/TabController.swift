//
//  TabController.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
    
    lazy var feedViewController: FeedViewController = {
        let vc = FeedViewController()
        vc.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "pencil"), tag: 0)
        return vc
    }()
    
    lazy var eventViewController: EventViewController = {
        let vc = EventViewController()
        vc.tabBarItem = UITabBarItem(title: "Event", image: UIImage(systemName: "trash"), tag: 1)
        return vc
    }()
    
    lazy var favoriteViewController: FavoriteViewController = {
        let vc = FavoriteViewController()
        vc.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "heart"), tag: 2)
        return vc
    }()
    
    lazy var profileViewController: ProfileViewController = {
        let vc = ProfileViewController()
        vc.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [feedViewController, eventViewController, favoriteViewController, profileViewController]
        selectedIndex = 3
    }
    
}