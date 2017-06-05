//
//  VPRLog.swift
//  Pods
//
//  Created by iljn on 6/4/17.
//
//

import Foundation

struct VPRLog {
    
    static let CN = "VPRLog"
    
    enum Mode {
        case VERBOSE
        case DEBUG
        case MINIMAL
        case OFF
    }
    static let mode:Mode = .VERBOSE
    
    // MARK: Log Functions
    // --------------------------------------------------------------------------
    
    // log an info message
    static func log(_ className:String, _ msg:String, _ mode:Mode) {
        _log("[\(className)] \(msg)", mode);
    }
    
    // log an error message
    static func err(_ className:String, _ msg:String, _ mode:Mode) {
        _log("!!!!!!!!!!!!!!!!!!!!! ERROR [\(className)] \(msg)", mode);
    }
    
    // log a warning message
    static func warn(_ className:String, _ msg:String, _ mode:Mode) {
        _log("????????????????????? WARNING [\(className)] \(msg)", mode);
    }
    
    // MARK: Log Util Functions
    // --------------------------------------------------------------------------
    
    // filter logs based on mode
    static func _log(_ msg:String, _ mode:Mode) {
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
