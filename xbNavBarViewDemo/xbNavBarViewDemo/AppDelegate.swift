//
//  AppDelegate.swift
//  xbNavBarViewDemo
//
//  Created by huadong on 2022/2/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window?.frame = UIScreen.main.bounds
        self.window?.backgroundColor = UIColor.white
        
        self.window?.rootViewController = ViewController()
        
        self.window?.makeKeyAndVisible()
        
        
        return true
    }

   


}

