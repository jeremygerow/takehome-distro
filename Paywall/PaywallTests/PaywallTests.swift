//
//  PaywallTests.swift
//  PaywallTests
//
//  Copyright © 2020 Disney Streaming Services. All rights reserved.
//

import XCTest
@testable import Paywall

class PaywallTests: XCTestCase {
    func testService() {
        let expection = expectation(description: "PaywallService")
        let paywallService = PaywallService()
        paywallService.loadData { paywallSKU in
            guard let paywallSKU = paywallSKU else {
                XCTFail("PaywallSKU is missing")
                return
            }
            XCTAssertEqual(paywallSKU.title, "The best stories in all the world, all in one place.")
            XCTAssertEqual(paywallSKU.actionSignUp, "SIGN UP NOW")
            XCTAssertEqual(paywallSKU.description, "Start streaming Disney+ with your 7 day free trial, then only 6.99/month.")
            XCTAssertEqual(paywallSKU.sku, "dplus_free_trial")
            XCTAssertEqual(paywallSKU.backgroundImage, "http://localhost:8000/images/splash.png")
            XCTAssertEqual(paywallSKU.brandsImage, "http://localhost:8000/images/brands.png")
            XCTAssertEqual(paywallSKU.logoImage, "http://localhost:8000/images/logo.png")
            XCTAssertEqual(paywallSKU.actionLogIn, "Log In")
            XCTAssertEqual(paywallSKU.isFullscreen, true)
            expection.fulfill()
        }
        waitForExpectations(timeout: 60, handler: nil)
    }
}
