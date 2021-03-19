//
//  AppDelegate.swift
//  Project7
//
//  Created by Shibo Sun on 2021/3/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if let tabBarController = window?.rootViewController as? UITabBarController{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "NavController")
            vc.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
            let vc1 = storyboard.instantiateViewController(identifier: "NavController")
            vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
            tabBarController.viewControllers?.append(vc)
            tabBarController.viewControllers?.append(vc1)
        }
        
        return true
    }


}

