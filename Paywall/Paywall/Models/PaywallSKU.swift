//
//  PaywallSKU.swift
//  Paywall
//
//  Created by Jeremy Gerow on 2/24/21.
//  Copyright © 2021 Disney Streaming Services. All rights reserved.
//

import Foundation

class PaywallSKU: Codable {
    let title: String
    let actionSignUp: String
    let description: String
    let sku: String
    let backgroundImage: String?
    let brandsImage: String?
    let logoImage: String?
    let actionLogIn: String?
    let isFullscreen: Bool
}
