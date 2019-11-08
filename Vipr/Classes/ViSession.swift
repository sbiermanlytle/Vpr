//
//  ViSession.swift
//  Pods
//
//  Created by Sebastian Bierman-Lytle on 6/10/17.
//
//

import Foundation
import CoreData

public struct ViSession {
    
    public static var isFirstSession: Bool = false
    
    // MARK: Initialization
    // --------------------------------------------------------------------------
    public static func start() {
        ViLog.open("ViSession", "start", .VERBOSE)
        ViAnalytics.start()
        ViAnalytics.appOpen()
        
        let defaults = UserDefaults.standard
        let previouslyInstalled = defaults.bool(forKey: "INSTALLED")
        if !previouslyInstalled {
            ViAnalytics.install()
            defaults.set(true, forKey: "INSTALLED")
            ViLog.log("ViSession start", "First Install", .DEBUG)
            ViSession.isFirstSession = true
        } else {
            ViLog.log("ViSession start", "Previous Install", .DEBUG)
            ViSession.isFirstSession = false
        }
        ViLog.close("ViSession", "start", .VERBOSE)
    }
}
