//
//  SceneDelegate.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let rootVC  = CartoonListRouter.createModule()

        window.rootViewController = UINavigationController(rootViewController: rootVC)
        window.makeKeyAndVisible()
        self.window = window
        
        
    }
    
    // Called when the scene becomes active
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("Scene became active")
        // Restart tasks or refresh UI
    }
    
    // Called when the scene will move from active to inactive
    func sceneWillResignActive(_ scene: UIScene) {
        print("Scene will resign active")
        // Pause ongoing tasks or disable UI updates
    }
    
    // Called when the scene enters background
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("Scene entered background")
        // Save state, release shared resources
    }
    
    // Called when the scene transitions from background to foreground
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("Scene will enter foreground")
        // Undo background changes
    }
    
    // Optional: scene disconnection (rarely used)
    func sceneDidDisconnect(_ scene: UIScene) {
        print("Scene disconnected")
        // Release resources specific to this scene
    }
    
    
    
    
}

