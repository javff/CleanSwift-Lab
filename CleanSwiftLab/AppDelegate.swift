//
//  AppDelegate.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/5/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let viewController = HomeFeedCreator().configure()
        let rootViewController = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible() 
        return true
    }

}

