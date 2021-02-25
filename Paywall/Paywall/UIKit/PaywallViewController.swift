//
//  PaywallViewController.swift
//  Paywall
//
//  Copyright © 2020 Disney Streaming Services. All rights reserved.
//

import UIKit

class PaywallViewController: UIViewController {
    private let paywallService = PaywallService()
    private var currentSKU: PaywallSKU?
    private var currentPaywallView: PaywallSKUView?
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //loadData()
        reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //dataTask?.cancel()
        paywallService.cancel()
    }
    
    //private func loadPaywallView() -> PaywallContentView? {
    //}
    
    private func reloadData() {
        paywallService.loadData { [weak self] sku in
            self?.currentSKU = sku
            self?.updatePaywallView(sku: sku)
        }
    }
    
    private func updatePaywallView(sku: PaywallSKU?) {
        currentPaywallView?.removeFromSuperview()
        guard let sku = sku, let paywallView = loadPaywallView(isFullscreen: sku.isFullscreen) else {
            return
        }
        paywallView.delegate = self
        paywallView.autoresizesSubviews = false
        view.addSubview(paywallView)
        paywallView.pinToSuperview()
        paywallView.updateUI(sku: sku)
        currentPaywallView = paywallView
    }
    
    private func loadPaywallView(isFullscreen: Bool) -> PaywallSKUView? {
        if isFullscreen {
            let paywallView: PaywallFullscreenView? = PaywallFullscreenView.loadFromNib()
            return paywallView
        } else {
            let paywallView: PaywallModalView? = PaywallModalView.loadFromNib()
            return paywallView
        }
    }

    private func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
        })
        present(alert, animated: true, completion: nil)
    }

    func didShake() {
        reloadData()
    }
}

extension PaywallViewController {
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
    if motion == .motionShake {
      didShake()
    }
  }
}

extension PaywallViewController: PaywallViewDelegate {
    func signUp() {
        guard let sku = currentSKU?.sku else {
            return
        }
        showAlert(title: "Purchase: \(sku)")
    }
    
    func logIn() {
        showAlert(title: "Log In")
    }
}
