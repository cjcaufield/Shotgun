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
    
    override func cellIdentifierForObject(_ object: AnyObject) -> String {
        return "PlaceCell"
    }
    
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "PlaceDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaceDetailSegue" {
            if let index = self.selectedIndex {
                let placeController = segue.destination as! PlaceViewController
                placeController.object = objects[index]
            }
        }
    }
}
