//
//  ViAnalytics.swift
//  Pods
//
//  Created by Sebastian Bierman-Lytle on 6/10/17.
//
//

import Foundation

public struct ViAnalytics {
    
    public enum Mode {
        case DEV
        case STAGING
        case PROD
    }
    public static let mode:Mode = .DEV
    public static var modules:[ViAnalyticsModule] = []
    
    // MARK: Initialization
    // --------------------------------------------------------------------------
    public static func start() {
        //ViLog.log("ViAnalytics start", "", .VERBOSE)
        for mod in modules {
            type(of: mod).start()
        }
    }
    
    // MARK: Events
    // --------------------------------------------------------------------------
    public static func track(_ event: String) {
        for mod in modules {
            type(of: mod).track(event)
        }
    }
    public static func trackSwitch(_ event: String, _ isON: Bool) {
        track("\(event) \(isON ? "ON" : "OFF")")
    }
    public static func install() {
        track("Install")
    }
    public static func appOpen() {
        track("App Open")
    }
}
