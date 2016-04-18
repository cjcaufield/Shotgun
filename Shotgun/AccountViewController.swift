//
//  AccountViewController.swift
//  Shotgun
//
//  Created by Colin Caufield on 2016-02-15.
//  Copyright © 2016 Secret Geometry, Inc. All rights reserved.
//

import UIKit
import SecretKit

class AccountViewController: SGDynamicTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Account"
    }
    
    var username = "Colin"
    var password = "Open Sesame"
    var location = "Downtown Vancouver"
    var groups   = 14
    var vehicle  = "Nissan"
    var seats    = 2
    
    override func makeTableData() -> SGTableData {
    
        return (
            SGTableData(
                SGSectionData(
                    SGRowData(cellIdentifier: TEXT_FIELD_CELL_ID,   title: "Username",  modelPath: "username", targetType: .ViewController),
                    SGRowData(cellIdentifier: TEXT_FIELD_CELL_ID,   title: "Password",  modelPath: "password", targetType: .ViewController)
                ),
                SGSectionData(
                    SGRowData(cellIdentifier: TEXT_FIELD_CELL_ID,   title: "Location",  modelPath: "location", targetType: .ViewController),
                    SGRowData(cellIdentifier: LABEL_CELL_ID,        title: "Groups",    modelPath: "groups", targetType: .ViewController)
                ),
                SGSectionData(
                    SGRowData(cellIdentifier: LABEL_CELL_ID,        title: "Vehicle",   modelPath: "vehicle", targetType: .ViewController),
                    SGRowData(cellIdentifier: LABEL_CELL_ID,        title: "Seats",     modelPath: "seats", targetType: .ViewController)
                )
            )
        )
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:     return " "
        case 1:     return " "
        case 2:     return " "
        default:    return " "
        }
    }
}
