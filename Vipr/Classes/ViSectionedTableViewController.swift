//
//  ViSectionedTableViewController.swift
//  Pods
//
//  Created by iljn on 8/5/17.
//
//

import Foundation

import UIKit

open class ViSectionedTableViewController<T>: ViTableViewController<T>  {
    
    // MARK: Public Data
    // --------------------------------------------------------------------------
    open var subSections: [[T]] = []
    
    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subSections[section].count + 1
    }
}
