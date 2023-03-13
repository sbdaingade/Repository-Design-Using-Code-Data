//
//  Repository_Design_Using_Code_DataUITestsLaunchTests.swift
//  Repository-Design-Using-Code-DataUITests
//
//  Created by Sachin Daingade on 12/03/23.
//

import XCTest

final class Repository_Design_Using_Code_DataUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
