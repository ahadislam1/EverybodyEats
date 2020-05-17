//
//  EventDataBaseService.swift
//  EverybodyEats
//
//  Created by Jaheed Haynes on 4/23/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class EventDataBaseService {
    
    static let usersCollection = "users"
    static let eventsCollection = "events"
    
    private let db = Firestore.firestore()
    
    static let helper = EventDataBaseService()
    
    private init() {}
    
    
    public func createEvent(event: Event, completion: @escaping (Result<Bool, Error>) -> ()) {
        let docRef = db.collection(EventDataBaseService.eventsCollection).document(event.id)
        do {
            try docRef.setData(from: event) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(true))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    public func getEvents(completion: @escaping (Result<[Event], Error>) -> ()) {
        let docRef = db.collection(EventDataBaseService.eventsCollection)
        docRef.getDocuments { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else if let snapshot = snapshot {
                let posts = snapshot.documents.compactMap {
                    return try? $0.data(as: Event.self)
                }
                completion(.success(posts))
            }
        }
    }
    
    public func favoriteEvent(userID: String, event: Event, completion: @escaping (Result<Bool, Error>) -> ()) {
        let docRef = db.collection(EventDataBaseService.usersCollection)
            .document(userID)
            .collection(EventDataBaseService.eventsCollection)
            .document(event.id)
        
        docRef.setData(["imageURL": event.imageURL,
                        "description": event.description,
                        "userId": event.userId,
                        "userHandle": event.userHandle,
                        "createdDate": event.createdDate,
                        "like": ["count": event.like.count,
                                 "favoritedBy": event.like.favoritedBy],
                        "id": event.id,
                        "allergen":event.allergen]) { error in
                            if let error = error {
                                completion(.failure(error))
                            } else {
                                completion(.success(true))
                            }
        }
    }
    
    public func unfavoriteEvent(userID: String, eventID: String, completion: @escaping (Result<Bool, Error>) -> ()) {
        let docRef = db.collection(EventDataBaseService.usersCollection)
            .document(userID)
            .collection(EventDataBaseService.eventsCollection)
            .document(eventID)
        
        docRef.delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }
    
    public func updateEvent(event: Event) {
        let docRef = db.collection(PostDatabaseService.postsCollection)
            .document(event.id)
        
        try? docRef.setData(from: event)
    }
}
