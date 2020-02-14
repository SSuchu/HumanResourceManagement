//
//  AppDelegate.swift
//  DAIKO人事管理システム(従業員用)
//
//  Created by Sora Sawai on 2020/02/04.
//  Copyright © 2020 Sora Sawai. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // APIキーの設定とSDK初期化
        NCMB.initialize(applicationKey: "37a36da2c80c54cfa6fba73e906124381b6fa3c319939e42ae5e067c26d13784", clientKey: "2c8e962170dbe7a82680e15aeb5fe59fa55d48e4d0998645fc96cbaa82c9ddda");
        // ↓　ここにサンプルコードを実装　↓

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

