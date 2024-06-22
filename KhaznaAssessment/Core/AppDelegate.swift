//
//  AppDelegate.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/24.
//

import UIKit

@main
internal final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private(set) lazy var coordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let splashViewController = SplashRouter.createModule()
        coordinator.setRoot(splashViewController)
        return true
    }
}
