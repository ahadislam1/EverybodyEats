//
//  PostDatabaseService.swift
//  EverybodyEats
//
//  Created by Jaheed Haynes on 4/21/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import FirebaseFirestore

class PostDatabaseService {
    
    static let userPostsCollection = "userPosts"
    
    private let db = Firestore.firestore()
    
    public func createPost(id: String, imageData: Data, caption: String, userHandle: String, createdDate: Date, likes: Like, completion: @escaping (Result<String, Error>) -> ()) {
        
        let documentRef = db.collection(PostDatabaseService.userPostsCollection).document()
        
        db.collection(PostDatabaseService.userPostsCollection).document(documentRef.documentID).setData(["id":id, "imageData":imageData, "caption":caption, "userHandle":userHandle, "createdDate":createdDate, "likes":likes]) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(documentRef.documentID))
            }
        }
    }
}
