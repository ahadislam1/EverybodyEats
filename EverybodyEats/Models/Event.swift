//
//  Event.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation

/// A user made-event, for something.
struct Event: Codable, Identification {
    let id: String
    let imageURL: String
    let description: String
    let userHandle: String
    let createdBy: String
    let userId: String
    let createdDate: Date
    let allergen: [String]
    let like: Like
    
    init(id: String, imageURL: String, description: String, userHandle: String, createdBy: String, userId: String, allergen: [String] ){
        createdDate = Date()
        like = Like()
        self.imageURL = imageURL
        self.description = description
        self.userHandle = userHandle
        self.createdBy = createdBy
        self.userId = userId
        self.id = id
        self.allergen = allergen
    }
}

extension Event{
    init(_ dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? "no id"
        self.imageURL = dictionary["imageURL"] as? String ?? " no imageURL"
        self.description = dictionary["caption"] as? String ?? "no description"
        self.userHandle = dictionary["userHandle"] as? String ?? "no userHandle"
        self.createdBy = dictionary["createdBy"] as? String ?? "no created by"
        self.createdDate = dictionary["createdDate"] as? Date ?? Date()
        self.userId = dictionary["userId"] as? String ?? "no userID"
        self.like = dictionary["like"] as? Like ?? Like(count: 1, favoritedBy: [])
        self.allergen = dictionary["allergen"] as? [String] ?? [Allergen.other.rawValue]
    }
}
