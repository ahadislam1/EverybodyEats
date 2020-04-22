//
//  User.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation

/// This struct is meant as a dummy for now.
struct User: Codable {
    let id: String
    let displayName: String
    let city: String
    var photoURL: String? = nil
    
    init(displayName: String, city: String) {
        id = UUID().uuidString
        self.displayName = displayName
        self.city = city
    }
    
    init(displayName: String, city: String, photoURL: String) {
        id = UUID().uuidString
        self.displayName = displayName
        self.city = city
        self.photoURL = photoURL
    }
    
}
