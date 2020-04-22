//
//  User.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation

/// This struct is meant as a dummy for now.
struct User: Codable {
    let id: String
    let displayName: String
    let city: String
    var photoURL: String? = nil
    
    init(displayName: String, city: String) {
        id = UUID().uuidString
        self.displayName = displayName
        self.city = city
    }
    
    init(id: String, displayName: String, city: String, photoURL: String) {
        self.id = id
        self.displayName = displayName
        self.city = city
        self.photoURL = photoURL
    }
}

extension User {
    static let ahad = User(id: "9A3E7941-9079-4653-AA3B-256A0F55268C", displayName: "Ahad Islam", city: "Casablanca", photoURL: "https://firebasestorage.googleapis.com/v0/b/everybodyeats-c1b0d.appspot.com/o/UserProfilesPhotos%2F55CD675C-A159-4ADF-B1C7-5D4C43981B2D.jpeg?alt=media&token=0f32bd43-d447-4a65-81cc-ed1869754ef6")
    static let chelsi = User(id: "154283C4-1C07-4962-B698-0358D379E3C9", displayName: "Chelsi Christmas", city: "Icheon", photoURL: "https://firebasestorage.googleapis.com/v0/b/everybodyeats-c1b0d.appspot.com/o/UserProfilesPhotos%2F55CD675C-A159-4ADF-B1C7-5D4C43981B2D.jpeg?alt=media&token=0f32bd43-d447-4a65-81cc-ed1869754ef6")
    static let jaheed = User(id: "DA00E4B7-D241-4E2F-AAA6-C824DE51958C", displayName: "Jaheed Haynes", city: "Kütahya", photoURL: "https://firebasestorage.googleapis.com/v0/b/everybodyeats-c1b0d.appspot.com/o/UserProfilesPhotos%2F55CD675C-A159-4ADF-B1C7-5D4C43981B2D.jpeg?alt=media&token=0f32bd43-d447-4a65-81cc-ed1869754ef6")
    static let matthew = User(id: "362BF5BD-EE76-4E7E-8FAA-FB2C1D641E97", displayName: "Matthew Ramos", city: "Medellin", photoURL: "https://firebasestorage.googleapis.com/v0/b/everybodyeats-c1b0d.appspot.com/o/UserProfilesPhotos%2F55CD675C-A159-4ADF-B1C7-5D4C43981B2D.jpeg?alt=media&token=0f32bd43-d447-4a65-81cc-ed1869754ef6")
}
