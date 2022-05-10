//
//  Text_Fields_UITestsLaunchTests.swift
//  Text Fields!UITests
//
//  Created by Admin on 06.05.2022.
//

import XCTest
//@testable import TestingUITextFieldProperties


class Text_Fields_UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
    }
}
