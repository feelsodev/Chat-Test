//
//  AppDelegate.swift
//  Chat-Test
//
//  Created by once on 2020/10/03.
//

import UIKit
import SwiftKeychainWrapper

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if KeychainWrapper.standard.string(forKey: "device_id") == nil {
            if let uuid = UIDevice.current.identifierForVendor?.uuidString {
                print(uuid)
                let saveSuccessful: Bool = KeychainWrapper.standard.set(uuid, forKey: "device_id")
                print("is successful : \(saveSuccessful)")
            }
        }
        // Override point for customization after application launch.
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


}

