//
//  UIView+Extensions.swift
//  Paywall
//
//  Created by Jeremy Gerow on 2/24/21.
//  Copyright © 2021 Disney Streaming Services. All rights reserved.
//

import UIKit

extension UIView {
    class func loadFromNib<T>() -> T? {
        let nibName = String(describing: T.self)
        guard let nib = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil) else {
            return nil
        }
        return nib.first as? T
    }
    
    func pinToSuperview() {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ])
    }
}
