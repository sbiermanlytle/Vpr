//
//  ViUser.swift
//  Pods
//
//  Created by Sebastian Bierman-Lytle on 6/10/17.
//
//

import Foundation
import SwiftyJSON

open class ViUser: ViRecord {
    
    // MARK: Class Properties
    // --------------------------------------------------------------------------
    var authenticationToken: String = ""
    
    var firstName: String = ""
    var lastName: String = ""
    var phone: String = ""
    var email: String = ""
    var addressStreet: String = ""
    var addressCity: String = ""
    var addressState: String = ""
    var addressCountry: String = ""
    var addressZip: UInt64 = 0
    
    // MARK: Static Functions
    // --------------------------------------------------------------------------
    open static func create(email: String, password: String, callback: (ViUser) -> Void) {
        let user = ViUser()
        user.email = email
        ViREST.create("users", data: user.toJSON())
    }
    
    // MARK: Class Functions
    // --------------------------------------------------------------------------
    open override func toJSON() -> JSON {
        return JSON([
            "name":"Jack",
            "age": 25
        ])
    }
}
