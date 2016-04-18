//
//  RideViewController.swift
//  Shotgun
//
//  Created by Colin Caufield on 2016-02-15.
//  Copyright © 2016 Secret Geometry, Inc. All rights reserved.
//

import UIKit
import SecretKit

class RideViewController: SGDynamicTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ride"
    }
    
    override func makeTableData() -> SGTableData {
        
        return (
            SGTableData(
                SGSectionData(
                    SGRowData(cellIdentifier: TEXT_FIELD_CELL_ID, title: "Date", modelPath: "date"),
                    SGRowData(cellIdentifier: TEXT_FIELD_CELL_ID, title: "Time", modelPath: "time")
                )
            )
        )
    }
}
