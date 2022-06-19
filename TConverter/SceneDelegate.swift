//
//  SceneDelegate.swift
//  TConverter
//
//  Created by Kirill Grunin on 19.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        let home = ViewController()
        self.window?.rootViewController = home
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }
}

