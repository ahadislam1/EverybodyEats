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
    static let favoritesPostsCollection = "favPosts"
    
    private let db = Firestore.firestore()
    
    public func createPost(imageData: Data, caption: String, userHandle: String, createdDate: Date, likes: Like, completion: @escaping (Result<String, Error>) -> ()) {
        
        let documentRef = db.collection(PostDatabaseService.userPostsCollection).document()
        
        db.collection(PostDatabaseService.userPostsCollection).document(documentRef.documentID).setData([ "imageData":imageData, "caption":caption, "userHandle":userHandle, "createdDate":createdDate, "likes":likes]) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(documentRef.documentID))
            }
        }
    }
    
    public func addToFavorites(post: Post, completion: @escaping(Result<Bool,Error>) -> ()){
        //guard let user = Auth.auth().currentUser else {return}
        
        db.collection(PostDatabaseService.userPostsCollection ).document(post.id).collection(PostDatabaseService.favoritesPostsCollection).document(post.id).setData(
            ["id":post.id,
             "imageData": post.imageData as Any,
             "caption": post.caption,
             "favortieDate": Timestamp(date: Date()),
             "userHandle": post.userHandle,
             "createdDate": post.createdDate,
             "likes": post.id]) { (error) in
                if let error = error {
                    completion(.failure(error))
                }else{
                    completion(.success(true))
                }
        }
        
    }
    
    public func removeFromFavorite(post: Post, completion: @escaping(Result<Bool,Error>) -> ()){
       // guard let user = Auth.auth().currentUser else {return}
        
        db.collection(PostDatabaseService.userPostsCollection   ).document(post.id).collection(PostDatabaseService.favoritesPostsCollection).document(post.id).delete(){ (error) in
            if let error = error{
                completion(.failure(error))
            }else{
                completion(.success(true))
            }
        }
    }
    
}
