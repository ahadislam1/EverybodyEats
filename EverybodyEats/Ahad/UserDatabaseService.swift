//
//  UserDatabaseService.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/22/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

enum DatabaseError: Error {
    case doesNotExist
}

class UserDatabaseService {
    static let helper = UserDatabaseService()
    
    private static let usersCollection = "users"
    
    private let db = Firestore.firestore()
    
    private init () {}
    
    func getUser(id: String, completion: @escaping (Result<User, Error>) -> ()) {
        let docRef = db.collection(UserDatabaseService.usersCollection).document(id)
        docRef.getDocument { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else if let snapshot = snapshot {
                do {
                    if let user = try snapshot.data(as: User.self) {
                        completion(.success(user))
                    } else {
                        completion(.failure(DatabaseError.doesNotExist))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func createUser(user: User, completion: @escaping (Result<Bool, Error>) -> ()) {
        let docRef = db.collection(UserDatabaseService.usersCollection).document(user.id)
        do {
            try docRef.setData(from: user) { error in
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
    
    func updateUser(id: String, city: String? = nil, name: String? = nil, imageURL: URL? = nil) {
        
    }
}
