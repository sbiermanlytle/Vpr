//
//  ViMixpanel.swift
//  Pods
//
//  Created by iljn on 7/25/17.
//
//

import Foundation
// import Mixpanel

public struct ViMixpanel: ViAnalyticsModule {
    
    public enum Mode {
        case DEV
        case STAGING
        case PROD
    }
    public static var mode: Mode = .DEV
    
    // MARK: API Keys
    // --------------------------------------------------------------------------
    public static var cTokenDev: String = ""
    public static var cTokenStaging: String = ""
    public static var cTokenProd: String = ""
    
    public static func getToken() -> String {
        switch(mode) {
        case .DEV: return ViMixpanel.cTokenDev;
        case .STAGING: return ViMixpanel.cTokenStaging;
        case .PROD: return ViMixpanel.cTokenProd;
        }
    }
    
    // MARK: Initialization
    // --------------------------------------------------------------------------
    public init() {}
    
    public static func start() {
        ViLog.log("ViMixpanel start", "", .VERBOSE)
        // Mixpanel.initialize(token: ViMixpanel.getToken())
    }
    
    // MARK: Events
    // --------------------------------------------------------------------------
    public static func track(_ event: String) {
        ViLog.log("ViMixpanel", "Event: \(event)", .DEBUG)
        // Mixpanel.mainInstance().track(event: event)
    }
}
