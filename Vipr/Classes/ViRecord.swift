//
//  ViRecord.swift
//  Pods
//
//  Created by Sebastian Bierman-Lytle on 6/10/17.
//
//

import Foundation
import SwiftyJSON

open class ViRecord: NSObject {
    
    // MARK: Class Properties
    // --------------------------------------------------------------------------
    var dbID: UInt64 = 0
    var table: String = ""
    
    // MARK: Initialize Function
    // --------------------------------------------------------------------------
    convenience override init() {
        self.init(withID: 0)
    }
    
    init(withID id: UInt64) {
        self.dbID = id
        super.init()
    }
    
    // MARK: REST Functions
    // --------------------------------------------------------------------------
    open static func create(opts: JSON, callback: (ViUser) -> Void) {
        let obj = ViRecord()
        ViREST.create(obj.table, data: obj.toJSON())
    }
    
    // MARK: Class Functions
    // --------------------------------------------------------------------------
    open func toJSON() -> JSON {
        return JSON([
            "name":"Jack",
            "age": 25
        ])
    }
}
