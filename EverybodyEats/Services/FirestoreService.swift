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
    
    static let usersCollection = "users"
    static let eventsCollection = "events"
    
    static let helper = FirestoreService()

    private let db = Firestore.firestore()
    
    private init() {}
    
    public func createItem<T: Codable>(item: T, completion: @escaping(Result<Void, Error>) -> ()) {
        
    }
}
