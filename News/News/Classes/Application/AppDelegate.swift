//
//  AppDelegate.swift
//  News
//
//  Created by 刘 on 17/2/24.
//  Copyright © 2017年 刘. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setupRootViewController() //设置根控制器
        
        // Override point for customization after application launch.
        return true
    }

    /// 设置根控制器
    fileprivate func setupRootViewController(){
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // 判断是否有新的版本
        if isNewVersion() {
            window?.rootViewController = NewFeatureViewController()
            
        }else{
            window?.rootViewController = MainTabBarController()
        }
        
        window?.makeKeyAndVisible()
        
    }
    
    
    fileprivate func isNewVersion() -> Bool {
    //获取当前的版本号
        let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        
    //取到之前r的版本号
        let sandboxVersionKey = "sandboxVersionKey"
        let sandboxVersion = UserDefaults.standard.string(forKey: sandboxVersionKey)
     // 保存当前的版本号
        UserDefaults.standard.set(currentVersion, forKey: sandboxVersionKey)
        UserDefaults.standard.synchronize()
        
        // 当前版本和沙盒版本不一样就是新的版本
        return currentVersion != sandboxVersion
        
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

