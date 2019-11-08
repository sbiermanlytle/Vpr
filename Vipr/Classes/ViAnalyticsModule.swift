//
//  ViAnalyticsModule.swift
//  Pods
//
//  Created by Sebastian Bierman-Lytle on 6/10/17.
//
//

import Foundation

public protocol ViAnalyticsModule {
    
    // MARK: Initialization
    // --------------------------------------------------------------------------
    static func start()
    
    // MARK: Events
    // --------------------------------------------------------------------------
    static func track(_ event: String)
}
