//
//  Text_Fields_UITests.swift
//  Text Fields!UITests
//
//  Created by Admin on 06.05.2022.
//

import XCTest


class Text_Fields_UITests: XCTestCase {

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let firstTF = app.textFields["firstT"]
        firstTF.tap()
        firstTF.typeText("String with 123 digits")
        XCTAssertEqual(firstTF.value as! String, "String with  digits")
        let secondTF = app.textFields["secondT"]
        secondTF.tap()
        secondTF.typeText("Long String")
        XCTAssert(app.staticTexts["-1"].exists)
        let thirdTF = app.textFields["thirdT"]
        thirdTF.tap()
        thirdTF.typeText("abcde-madasda12345")
        XCTAssertEqual(thirdTF.value as! String, "abcde-12345")
        let fourthTF = app.textFields["fourthT"]
        fourthTF.tap()
        fourthTF.typeText("https://www.youtube.com")
        let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
        let isSafariBrowserOpen = safari.wait(for: .runningForeground, timeout: 30)
        if isSafariBrowserOpen {
            sleep(4)
            XCUIDevice.shared.press(.home)
            sleep(1)
            XCUIApplication().activate()
            sleep(1)
        }
        let progBar = app.progressIndicators["currentProgress"]
        let fifthTF = app.textFields["fifthT"]
        fifthTF.tap()
        fifthTF.typeText("qdhlyr159@Aa")
        sleep(1)
//        let currentValue = progBar.value as? String
        XCTAssertTrue(progBar.exists)
//        XCTAssertEqual(currentValue, "100 %")
        XCTAssert(app.staticTexts["✓ minimum of 8 characters."].exists)
        XCTAssert(app.staticTexts["✓ minimum 1 digit."].exists)
        XCTAssert(app.staticTexts["✓ minimum 1 lowercase."].exists)
        XCTAssert(app.staticTexts["✓ minimum 1 uppercase."].exists)
    }
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
                
            }
        }
    }
}

