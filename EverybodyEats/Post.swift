//
//  Post.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import Firebase

/// A user-made object
struct Post: Codable {
    let id = UUID().uuidString
    let imageData: Data?
    let caption: String
    let userHandle: String
    let createdDate: String
    let likes = Like()
}

//extension Post {
//  init(_ dictionary: [String: Any]) {
//    self.id = dictionary["id"] as? String ?? "no id"
//    self.imageData = dictionary["imageData"] as? Data ?? Data.init()
//    self.caption = dictionary["caption"] as? String ?? "no caption"
//    self.userHandle = dictionary["userHandle"] as? String ?? "no userHandle"
//    self.createdDate = dictionary["createdDate"] as? String ?? "no created date"
//    self.likes = dictionary["likes"] as? Like ?? Like.self
//  }
//}
