//
//  ViListVC.swift
//  Pods
//
//  Created by Sebastian Bierman-Lytle on 6/10/17.
//
//

import Foundation

open class ViListVC: ViTableViewController<Any> {
    
    open var header: ViNavbar!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorLiteralRed: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        header = ViNavbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80))
        self.view.addSubview(header)
        
        self.rows = ["This", "Is", "A", "List"]
        self.tableView.reloadData()
    }
}
