//
//  FirestoreService.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 5/17/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import FirebaseAuth
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
    
    public func createItem<T: Codable & Identification>(item: T, experience: CollectionExperience, completion: @escaping(Result<Void, Error>) -> ()) {
        
        let docRef = db.collection(experience.rawValue).document(item.id)
        
        do {
            try docRef.setData(from: item) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    public func loadItems<T: Codable & Identification>(type: T.Type, experience: CollectionExperience, completion: @escaping (Result<[T], Error>) -> ()) {
        
        let docRef = db.collection(experience.rawValue)
        
        docRef.getDocuments { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else if let snapshot = snapshot {
                let items = snapshot.documents.compactMap {
                    return try? $0.data(as: T.self)
                }
                completion(.success(items))
            }
        }
    }
    
    /**
     TODO: Making a better listener, currently what we have is ok but we can do better.
     */
    
    /**
     TODO: Make a favoriting feature.  Our current implementation just sets data to a new document; however what we really need is a reference to the document (item).
     Relevant information on the topic can be found here:
     https://firebase.google.com/docs/reference/swift/firebasefirestore/api/reference/Classes/DocumentReference
     */
    
    
}
