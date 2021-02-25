//
//  PaywallSKUView.swift
//  Paywall
//
//  Created by Jeremy Gerow on 2/24/21.
//  Copyright © 2021 Disney Streaming Services. All rights reserved.
//

import UIKit

protocol PaywallSKUView: UIView {
    var delegate: PaywallViewDelegate? { get set }
    
    func updateUI(sku: PaywallSKU)
}
