//
//  StorageService.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/22/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import FirebaseStorage

class StorageService {
    static var helper = StorageService()
    
    private let storageRef = Storage.storage().reference()
    
    private init() {}
    
    public func uploadPhoto(userId: String? = nil,
                            postId: String? = nil,
                            eventId: String? = nil,
                            imageURL: URL,
                            completion: @escaping (Result<URL, Error>) -> Void) {
        
        var photoReference: StorageReference!
        
        if let id = userId {
            photoReference = storageRef.child("UserProfilesPhotos/\(id).jpeg")
        } else if let id = postId {
            photoReference = storageRef.child("PostsPhotos/\(id).jpeg")
        } else if let id = eventId {
            photoReference = storageRef.child("EventsPhotos/\(id).jpeg")
        }
        
        let _ = photoReference.putFile(from: imageURL, metadata: nil) { (metaData, error) in
            if let error = error {
                completion(.failure(error))
            } else if let _ = metaData {
                photoReference.downloadURL { (url, error) in
                    if let error = error {
                        completion(.failure(error))
                    } else if let url = url {
                        completion(.success(url))
                    }
                }
            }
        }
        
    }
}
