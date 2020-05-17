//
//  FirestoreService.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 5/17/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirestoreService {
    
    /// An enum to streamline choosing which collection you'd like to access.
    enum CollectionExperience: String {
        case users
        case events
        case posts
    }
    
    static let usersCollection = "users"
    static let eventsCollection = "events"
    static let postsCollection = "posts"
    
    static let helper = FirestoreService()

    private let db = Firestore.firestore()
    
    private init() {}
    
    public func createItem<T: Codable & Identifiable>(item: T, experience: CollectionExperience, completion: @escaping(Result<Void, Error>) -> ()) {
        
        
    }
}
