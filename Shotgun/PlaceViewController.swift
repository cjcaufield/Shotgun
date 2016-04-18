//
//  PlaceViewController.swift
//  Shotgun
//
//  Created by Colin Caufield on 2016-04-13.
//  Copyright © 2016 Secret Geometry, Inc. All rights reserved.
//

import UIKit
import SecretKit

class PlaceViewController: SGDynamicTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Place"
    }
    
    override func makeTableData() -> SGTableData {
        
        return (
            SGTableData(
                SGSectionData(
                    SGRowData(cellIdentifier: TEXT_FIELD_CELL_ID, title: "Name", modelPath: "name"),
                    SGRowData(cellIdentifier: TEXT_FIELD_CELL_ID, title: "Address", modelPath: "address")
                )
            )
        )
    }
}
