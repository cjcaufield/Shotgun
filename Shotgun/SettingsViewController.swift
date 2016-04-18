//
//  SettingsViewController.swift
//  Shotgun
//
//  Created by Colin Caufield on 2016-02-15.
//  Copyright © 2016 Secret Geometry, Inc. All rights reserved.
//

import UIKit
import SecretKit

class SettingsViewController: SGDynamicTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
    }
    
    let versionHack = NSNumber(double: 0.01)
    
    #if DEBUG
        let buildTypeHack = "DEBUG"
    #else
        let buildTypeHack = "RELEASE"
    #endif
    
    override func makeTableData() -> SGTableData {
        
        return (
            SGTableData(
                SGSectionData(
                    SGRowData(cellIdentifier: SWITCH_CELL_ID,       title: "Auto-Login",        modelPath: ""),
                    SGRowData(cellIdentifier: SWITCH_CELL_ID,       title: "Use Maps",          modelPath: ""),
                    SGRowData(cellIdentifier: SWITCH_CELL_ID,       title: "Print Logs",        modelPath: ""),
                    SGRowData(cellIdentifier: SWITCH_CELL_ID,   	title: "Show Admin Tools",  modelPath: "")
                ),
                SGSectionData(
                    SGRowData(cellIdentifier: LABEL_CELL_ID,        title: "Version",           modelPath: "versionHack",   targetType: .ViewController),
                    SGRowData(cellIdentifier: LABEL_CELL_ID,        title: "Build Type",        modelPath: "buildTypeHack", targetType: .ViewController),
                    SGRowData(cellIdentifier: DATE_LABEL_CELL_ID,   title: "Build Date",        modelPath: "")
                )
            )
        )
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
            case 0:     return " "
            case 1:     return " "
            default:    return " "
        }
    }
}
