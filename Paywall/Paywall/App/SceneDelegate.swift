//
//  SceneDelegate.swift
//  Paywall
//
//  Copyright © 2020 Disney Streaming Services. All rights reserved.
//

import UIKit
import SwiftUI

let useUIKit = true

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

    if useUIKit {
      let rootViewController = PaywallViewController()
      rootViewController.view.backgroundColor = .white
      if let windowScene = scene as? UIWindowScene {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = rootViewController
        self.window = window
        window.makeKeyAndVisible()
      }
    }
    else {
      let contentView = PaywallView()
      if let windowScene = scene as? UIWindowScene {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
      }
    }
  }
}

