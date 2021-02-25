//
//  PaywallContentView.swift
//  Paywall
//
//  Created by Jeremy Gerow on 2/24/21.
//  Copyright © 2021 Disney Streaming Services. All rights reserved.
//

import UIKit

class PaywallFullscreenView: UIView, PaywallSKUView {
    weak var delegate: PaywallViewDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var brandsImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
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
        brandsImageView.load(urlString: sku.brandsImage)
        logoImageView.load(urlString: sku.logoImage)
        logInButton.setTitle(sku.actionLogIn, for: .normal)
    }
}
