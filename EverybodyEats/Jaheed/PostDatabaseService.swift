//
//  PostDatabaseService.swift
//  EverybodyEats
//
//  Created by Jaheed Haynes on 4/21/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class PostDatabaseService {
    
    static let usersCollection = "users"
    static let postsCollection = "posts"
    
    private let db = Firestore.firestore()
    
    static let helper = PostDatabaseService()
    
    private init() {}
    
    
    public func createPost(post: Post, completion: @escaping (Result<Bool, Error>) -> ()) {
        let docRef = db.collection(PostDatabaseService.postsCollection).document(post.id)
        do {
            try docRef.setData(from: post) { error in
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
    
    public func getPosts(completion: @escaping (Result<[Post], Error>) -> ()) {
        let docRef = db.collection(PostDatabaseService.postsCollection)
        docRef.getDocuments { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else if let snapshot = snapshot {
                let posts = snapshot.documents.compactMap {
                    return try? $0.data(as: Post.self)
                }
                completion(.success(posts))
            }
        }
    }
    
    public func favoritePost(userID: String, post: Post, completion: @escaping (Result<Bool, Error>) -> ()) {
        let docRef = db.collection(PostDatabaseService.usersCollection)
            .document(userID)
            .collection(PostDatabaseService.postsCollection)
            .document(post.id)
        
        docRef.setData(["imageURL": post.imageURL,
                                "caption": post.caption,
                                "userId": post.userId,
                                "userHandle": post.userHandle,
                                "createdDate": post.createdDate,
                                "like": ["count": post.like.count,
                                         "favoritedBy": post.like.favoritedBy],
                                "id": post.id]) { error in
                                    if let error = error {
                                        completion(.failure(error))
                                    } else {
                                        completion(.success(true))
                                    }
        }
    }
    
    public func unfavoritePost(userID: String, postID: String, completion: @escaping (Result<Bool, Error>) -> ()) {
        let docRef = db.collection(PostDatabaseService.usersCollection)
        .document(userID)
            .collection(PostDatabaseService.postsCollection)
            .document(postID)
        
        docRef.delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }
        
    public func updatePost(post: Post) {
        let docRef = db.collection(PostDatabaseService.postsCollection)
            .document(post.id)
        
        try? docRef.setData(from: post)
    }
    
//    public func createPost(imageData: Data, caption: String, userHandle: String, createdDate: Date, likes: Like, completion: @escaping (Result<String, Error>) -> ()) {
//
//        let documentRef = db.collection(PostDatabaseService.userPostsCollection).document()
//
//        db.collection(PostDatabaseService.userPostsCollection).document(documentRef.documentID).setData([ "imageData":imageData, "caption":caption, "userHandle":userHandle, "createdDate":createdDate, "likes":likes]) { (error) in
//            if let error = error {
//                completion(.failure(error))
//            } else {
//                completion(.success(documentRef.documentID))
//            }
//        }
//    }
    
//    public func addToFavorites(post: Post, completion: @escaping(Result<Bool,Error>) -> ()){
//        //guard let user = Auth.auth().currentUser else {return}
//
//        db.collection(PostDatabaseService.userPostsCollection ).document(post.id).collection(PostDatabaseService.favoritesPostsCollection).document(post.id).setData(
//            ["id":post.id,
//             "imageURL": post.imageURL as Any,
//             "caption": post.caption,
//             "favortieDate": Timestamp(date: Date()),
//             "userHandle": post.userHandle,
//             "createdDate": post.createdDate,
//             "likes": post.id]) { (error) in
//                if let error = error {
//                    completion(.failure(error))
//                }else{
//                    completion(.success(true))
//                }
//        }
//
//    }
    
//    public func removeFromFavorite(post: Post, completion: @escaping(Result<Bool,Error>) -> ()){
//       // guard let user = Auth.auth().currentUser else {return}
//        
//        db.collection(PostDatabaseService.userPostsCollection   ).document(post.id).collection(PostDatabaseService.favoritesPostsCollection).document(post.id).delete(){ (error) in
//            if let error = error{
//                completion(.failure(error))
//            }else{
//                completion(.success(true))
//            }
//        }
//    }
    
}
