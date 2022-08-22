//
//  AppDelegate.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let vc = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = nav
        nav.addChild(vc)
        
        self.window?.makeKeyAndVisible()
        return true
    }


}

