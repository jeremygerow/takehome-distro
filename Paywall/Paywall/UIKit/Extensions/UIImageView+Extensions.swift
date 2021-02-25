//
//  UIImageView+Extensions.swift
//  Paywall
//
//  Created by Jeremy Gerow on 2/24/21.
//  Copyright © 2021 Disney Streaming Services. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            self.image = nil
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
