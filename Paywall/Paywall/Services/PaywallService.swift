//
//  PaywallService.swift
//  Paywall
//
//  Created by Jeremy Gerow on 2/24/21.
//  Copyright © 2021 Disney Streaming Services. All rights reserved.
//

import Foundation

class PaywallService {
    private static let paywallURL = "http://127.0.0.1:8000/response.json"
    private var dataTask: URLSessionDataTask?

    func loadData(completion: @escaping (PaywallSKU?) -> Void) {
        dataTask?.cancel()
        let session = URLSession.paywall
        guard let url = URL(string: PaywallService.paywallURL) else {
            return
        }
        dataTask = session.dataTask(with: url) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            if let data = data {
                let paywall = try? JSONDecoder().decode(Paywall.self, from: data)
                DispatchQueue.main.async {
                    completion(paywall?.skus.first)
                }
            }
        }
        dataTask?.resume()
    }
    
    func cancel() {
        dataTask?.cancel()
    }
}
