//
//  Like.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation

/// A struct to show how many people "like" an object, and string of users who do.
struct Like: Codable {
    var count = 0
    var favoritedBy = [String]()
    
    mutating func liked(userID: String) {
        guard !favoritedBy.contains(userID) else {
            return
        }
        count += 1
        favoritedBy.append(userID)
    }
    
    mutating func disliked(userID: String) {
        
        guard favoritedBy.contains(userID) else {
            return
        }
        
        count -= 1
        favoritedBy.removeAll(where: {$0 == userID})
        
    }
}
