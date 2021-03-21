//
//  SceneDelegate.swift
//  TestDispatchWithLegacyCode
//
//  Created by Fabio Cuomo on 21/03/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let remoteLoader = RemoteLoaderDecorator(RemoteLoader())
        let controller = ViewController(loader: remoteLoader)
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}

private class RemoteLoaderDecorator: Loader {
    private let decoratee: Loader
    
    init(_ decoratee: Loader) {
        self.decoratee = decoratee
    }
    
    func load(completion: @escaping (String) -> Void) {
        decoratee.load { message in
            if Thread.isMainThread {
                completion(message)
            } else {
                DispatchQueue.main.async {
                    completion(message)
                }
            }
        }
    }
}

