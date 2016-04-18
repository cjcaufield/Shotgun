//
//  PlacesViewController.swift
//  Shotgun
//
//  Created by Colin Caufield on 2016-02-15.
//  Copyright © 2016 Secret Geometry, Inc. All rights reserved.
//

import UIKit
import SecretKit

class PlacesViewController: SGCloudTableViewController {
    
    // MARK: - Properties
    
    override var typeName: String {
        return "Place"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Places"
    }
    
    // MARK: - Cells
    
    override func cellIdentifierForObject(object: AnyObject) -> String {
        return "PlaceCell"
    }
    
    // MARK: - Navigation
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedIndex = indexPath.row
        self.performSegueWithIdentifier("PlaceDetailSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PlaceDetailSegue" {
            if let index = self.selectedIndex {
                let placeController = segue.destinationViewController as! PlaceViewController
                placeController.object = objects[index]
            }
        }
    }
}
