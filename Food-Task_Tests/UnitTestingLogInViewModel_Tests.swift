//
//  UnitTestingLogInViewModel_Tests.swift
//  Food-Task_Tests
//
//  Created by Mina Mohareb on 29/03/2023.
//

import XCTest

@testable import Food_Task

final class UnitTestingLogInViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_UnitTestingLogInViewModel_isAuthenticated_ShouldBeTrue()
    {
        let userIsAuthenticated : Bool = true
        
        let loginViewModel = LogInViewModel(isAuthenticated: userIsAuthenticated)
        
        XCTAssertTrue(loginViewModel.isAuthenticated)
    }
    
    func test_UnitTestingLogInViewModel_isAuthenticated_ShouldBeFalse()
    {
        let userIsAuthenticated : Bool = false
        
        let loginViewModel = LogInViewModel(isAuthenticated: userIsAuthenticated)
        
        XCTAssertFalse(loginViewModel.isAuthenticated)
    }
}
