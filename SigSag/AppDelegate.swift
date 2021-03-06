//
//  AppDelegate.swift
//  SigSag
//
//  Created by 김시환 on 2019. 3. 3..
//  Copyright © 2019년 김시환. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    // 앱이 실행될 때 불리는 함수
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let pinkColor = UIColor(red: 248/255, green: 24/255, blue: 148/255, alpha: 1)
        let navigationBarAppearace = UINavigationBar.appearance()
        let tabBarAppearace = UITabBar.appearance()
        
        
        // Set Navigation Bar Background Color
        navigationBarAppearace.barTintColor = pinkColor
        // Set Navigation Bar font Color
        navigationBarAppearace.tintColor = UIColor.white
        // Set Navigation Bar title Color
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        // Set Tab Bar Backgroudn Color
        tabBarAppearace.barTintColor = UIColor.white
        // Set Tab Bar Backgroudn Color
        tabBarAppearace.tintColor = pinkColor
        
        // Set Status
        application.statusBarStyle = .lightContent
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

