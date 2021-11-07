//
//  SceneDelegate.swift
//  Coronavarus statistics
//
//  Created by Nihad on 1/1/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else {
            return
        }

        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        window?.rootViewController = TabBarController()
    }
}
