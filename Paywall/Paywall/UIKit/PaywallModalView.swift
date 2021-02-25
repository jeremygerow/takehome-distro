//
//  PaywallModalView.swift
//  Paywall
//
//  Created by Jeremy Gerow on 2/24/21.
//  Copyright © 2021 Disney Streaming Services. All rights reserved.
//

import UIKit

class PaywallModalView: UIView, PaywallSKUView {
    weak var delegate: PaywallViewDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logInButton: UIButton!
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        delegate?.signUp()
    }
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        delegate?.logIn()
    }
    
    func updateUI(sku: PaywallSKU) {
        titleLabel.text = sku.title
        signUpButton.setTitle(sku.actionSignUp, for: .normal)
        descriptionLabel.text = sku.description
        backgroundImageView.load(urlString: sku.backgroundImage)
        logInButton.setTitle(sku.actionLogIn, for: .normal)
    }
}
