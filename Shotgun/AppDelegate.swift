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

    // MARK: - Properties
    
    var window: UIWindow?
    var shouldLog = true

    var container: CKContainer {
        return CKContainer.defaultContainer()
    }
    
    var db: CKDatabase {
        return self.container.publicCloudDatabase
    }
    
    // MARK: - Queries
    
    func checkDB() {
        
        self.container.accountStatusWithCompletionHandler( { status, error in
            
            if let description = error?.description {
                print("Error = \(description)")
                return
            }
            
            print("Account status: ", terminator: "")
            
            switch status.hashValue {
            case 0:
                print("CouldNotDetermine")
            case 1:
                print("Available")
            case 2:
                print("Restricted")
            case 3:
                print("NoAccount")
            default:
                print("Unknown")
            }
            
        })
    }
    
    func addPlace(name: String) {
        
        let placeID = CKRecordID(recordName: name)
        let place = CKRecord(recordType: "Place", recordID: placeID)
        
        self.db.saveRecord(place) { savedPlace, error in
            
            if let error = error {
                
                print("Failed to save record: \(name).")
                print("ERROR: \(error.description)")

                if let delay = error.userInfo[CKErrorRetryAfterKey] as? NSTimeInterval {
                    
                    let date = NSDate(timeIntervalSinceNow: delay)
                    print("Should try again in \(delay) seconds.")
                }
            }
        }
    }
    
    func fetchPlace(name: String) {
        
        let placeID = CKRecordID(recordName: name)
        
        self.db.fetchRecordWithID(placeID) { fetchedPlace, error in
            
            guard let place = fetchedPlace else {
                
                print("Failed to fetch record: \(name).")
                
                if let error = error {
                    print("ERROR: \(error.description)")
                }
                
                return
            }
        }
    }
    
    func searchPlaces(searchString: String) {
        
        let predicate = NSPredicate(format: "name CONTAINS '\(searchString)'")
        let query = CKQuery(recordType: "Place", predicate: predicate)
        
        self.db.performQuery(query, inZoneWithID: nil) { results, error in
            
            // Do stuff.
        }
    }
    
    func watchPlaces(searchString: String) {
        
        let predicate = NSPredicate(format: "description CONTAINS '\(searchString)'")
        
        let subscription = CKSubscription(recordType: "Checkin", predicate: predicate, options: .FiresOnRecordCreation)
        
        let info = CKNotificationInfo()
        info.alertLocalizationKey = "NEW_PLACE_ALERT_KEY"
        info.soundName = "NewAlert.aiff"
        info.shouldBadge = true
        
        subscription.notificationInfo = info
        
        self.db.saveSubscription(subscription) { subscription, error in
            
            // Do stuff.
        }
    }
    
    // MARK: - Callbacks
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.checkDB()
        
        self.addPlace("UBC")
        
        //self.fetchPlace("UBC")
        
        return true
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        
        let note = CKNotification(fromRemoteNotificationDictionary: userInfo as! [String : NSObject])
        
        if note.notificationType == .Query, let queryNote = note as? CKQueryNotification {
        
            let recordID = queryNote.recordID
            
            // Do stuff.
        }
    }
}
