//
//  AppDelegate.swift
//  Shotgun
//
//  Created by Colin Caufield on 2016-02-15.
//  Copyright © 2016 Secret Geometry, Inc. All rights reserved.
//

import Foundation
import CloudKit
import SecretKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    
    var window: UIWindow?
    var cloudData: CloudData?
    
    // MARK: - Callbacks
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        let _ = CloudData.shared // Create this as early as possible.
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        
        self.cloudData?.handleRemoteNotification(userInfo)
    }
}
