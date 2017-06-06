//
//  VprLog.swift
//  Pods
//
//  Created by Sebastian Bierman-Lytle on 6/4/17.
//
//

import Foundation

public struct VprLog {
    
    static let CN = "VprLog"
    
    // MARK: Public Data
    // --------------------------------------------------------------------------
    
    public enum Mode {
        case VERBOSE
        case DEBUG
        case MINIMAL
        case OFF
    }
    public static var mode:Mode = .VERBOSE
    
    // MARK: Public Log Functions
    // --------------------------------------------------------------------------
    
    // log an info message
    public static func log(_ sourceName:String, _ msg:String, _ mode:Mode) {
        _log("[\(sourceName)] \(msg)", mode);
    }
    
    // log an error message
    public static func err(_ sourceName:String, _ msg:String, _ mode:Mode) {
        _log("!! ERROR [\(sourceName)] \(msg)", mode);
    }
    
    // log a warning message
    public static func warn(_ sourceName:String, _ msg:String, _ mode:Mode) {
        _log("?? WARNING [\(sourceName)] \(msg)", mode);
    }
    
    // MARK: Internal Log Functions
    // --------------------------------------------------------------------------
    
    // filter logs based on mode
    internal static func _log(_ msg:String, _ mode:Mode) {
        if _modeIsAllowed(mode) {
            print(msg);
        }
    }
    
    // log filter
    static func _modeIsAllowed(_ mode:Mode) -> Bool {
        switch mode {
        case .OFF:
            return false
        case .MINIMAL:
            if mode == .MINIMAL {
                return true
            }
            return false
        case .DEBUG:
            if (mode == .DEBUG || mode == .MINIMAL) {
                return true
            }
            return false
        case .VERBOSE:
            if (mode == .DEBUG || mode == .MINIMAL || mode == .VERBOSE) {
                return true
            }
            return false
        }
    }
}
