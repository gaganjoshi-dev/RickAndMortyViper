//
//  AppDelegate.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("App launched")

        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
   
    
    // MARK: - App State Transitions
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("App became active")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("App will resign active")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("App entered background")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("App will enter foreground")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("App will terminate")
    }
    
    
}

