//
//  Post.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation

/// A user-made object
struct Post: Codable {
    let id = UUID().uuidString
    let imageData: Data?
    let caption: String
    let userHandle: String
    let createdDate: Date
    let likes = Like()
}
