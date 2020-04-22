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
}
