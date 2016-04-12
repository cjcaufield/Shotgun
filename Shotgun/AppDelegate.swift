//
//  AppDelegate.swift
//  Shotgun
//
//  Created by Colin Caufield on 2016-02-15.
//  Copyright © 2016 Secret Geometry, Inc. All rights reserved.
//

import UIKit
import CloudKit
import SecretKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let publicDB = CKContainer.defaultContainer().publicCloudDatabase
        
        let placeID = CKRecordID(recordName: "UBC")
        let place = CKRecord(recordType: "Place", recordID: placeID)
        
        publicDB.saveRecord(place) { savedRecord, error in
            // handle errors
        }
        
        return true
    }
}
