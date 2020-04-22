//
//  StorageService.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/22/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import FirebaseStorage

enum Experience {
    case user
    case post
    case event
}

class StorageService {
    static var helper = StorageService()
    
    private let storageRef = Storage.storage().reference()
    
    private init() {}
    
    public func uploadPhoto(id: String, experience: Experience,
                            imageURL: URL,
                            completion: @escaping (Result<URL, Error>) -> Void) {
        
        var photoReference: StorageReference!
        
        switch experience {
        case .user:
            photoReference = storageRef.child("UserProfilesPhotos/\(id).jpeg")
        case .post:
            photoReference = storageRef.child("PostsPhotos/\(id).jpeg")
        case .event:
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
