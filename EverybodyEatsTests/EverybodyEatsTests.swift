//
//  EverybodyEatsTests.swift
//  EverybodyEatsTests
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import XCTest
@testable import EverybodyEats

class EverybodyEatsTests: XCTestCase {
    
    func testGetUser() {
        let exp = XCTestExpectation(description: "Success")
        let userTestID = "ggMbMkVV6Vdqvr70RiHL"
        UserDatabaseService.helper.getUser(id: userTestID) { result in
            switch result {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .success(let user):
                XCTAssert(user.id == userTestID, "Expected \(userTestID), but got \(user.id)")
                exp.fulfill()
            }
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testCreateUser() {
        let exp = XCTestExpectation(description: "Succession")
        let user = User(displayName: "Chelsi Christmas", city: "Icheon")
        UserDatabaseService.helper.createUser(user: user) { result in
            switch result {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .success:
                exp.fulfill()
            }
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testCreatePost() {
//        let exp = XCTestExpectation(description: "Succession")
//        let post = Post(id: UUID().uuidString, imageURL: "false", caption: "caption", userHandle: "userHandle", userId: )
//
//        PostDatabaseService.helper.createPost(post: post) { result in
//            switch result {
//            case .failure(let error):
//                XCTFail(error.localizedDescription)
//            case .success(let bool):
//                XCTAssert(bool == true)
//                exp.fulfill()
//            }
//        }
//
//        wait(for: [exp], timeout: 2)
        
    }
    
    func testGetPosts() {
        let exp = XCTestExpectation(description: "Watermleon")
        
        PostDatabaseService.helper.getPosts { result in
            switch result {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .success(let posts):
                XCTAssert(!posts.isEmpty)
                exp.fulfill()
            }
        }
        
        wait(for: [exp], timeout: 2)
    }
    
    func testFavorite() {
        let exp = XCTestExpectation(description: "Ice cream lethargy")
        let post = Post(id: UUID().uuidString, imageURL: "false", caption: "string", userHandle: "userHandle", userId: "9A3E7941-9079-4653-AA3B-256A0F55268C")
        
        
        PostDatabaseService.helper.favoritePost(userID: "9A3E7941-9079-4653-AA3B-256A0F55268C", post: post) { result in
            switch result {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .success(let bool):
                XCTAssert(bool == true)
                exp.fulfill()
                
                
                
            }
            
            
        }
        
        wait(for: [exp], timeout: 5)
    }
    
    func testUnfavorite() {
        let exp = XCTestExpectation(description: "ihatemyself")
        let postID = "417D18AE-54F0-4601-B210-F6EED39CAD19"
        
        PostDatabaseService.helper.unfavoritePost(userID: "9A3E7941-9079-4653-AA3B-256A0F55268C", postID: postID) { result in
            switch result {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .success(let bool):
                XCTAssert(bool == true)
                exp.fulfill()
            }
        }
        
        wait(for: [exp], timeout: 3)
    }
}
