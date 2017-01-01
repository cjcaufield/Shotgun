//
//  RidesViewController.swift
//  Shotgun
//
//  Created by Colin Caufield on 2016-02-15.
//  Copyright © 2016 Secret Geometry, Inc. All rights reserved.
//

import UIKit
import SecretKit

class RidesViewController: SGCloudTableViewController {

    // MARK: - Properties
    
    override var typeName: String {
        return "Ride"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Rides"
    }
    
    // MARK: - Cells
    
    override func cellIdentifierForObject(_ object: AnyObject) -> String {
        return "RideCell"
    }
    
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "RideDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RideDetailSegue" {
            if let index = self.selectedIndex {
                let placeController = segue.destination as! PlaceViewController
                placeController.object = objects[index]
            }
        }
    }
}
