//
//  ViAB.swift
//  Pods
//
//  Created by iljn on 7/25/17.
//
//

import Foundation

public struct ViAB {
    
    public static var config: [String: Any] = [:]
    
    public static func setABValue(_ key: String, _ value: Any) {
        ViLog.log("ViAB", "set AB: \(key) = \(value)", .MINIMAL)
        ViAB.config[key] = value
    }
    
    public static func initABTest(_ key: String, _ possibleValues: [Any], _ split: UInt32) {
        ViAB.config[key] = arc4random_uniform(100) < split ? possibleValues.first : possibleValues.last
        ViLog.log("ViAB", "set AB: \(key) = \(String(describing: ViAB.config[key]))", .MINIMAL)
    }
    
    public static func initABCTest(_ key: String, _ possibleValues: [Any], _ percentages: [UInt32]) {
        let rand = arc4random_uniform(100)
        for (i, val) in possibleValues.enumerated() {
            if i < percentages.count {
                if rand < percentages[i] {
                    ViAB.config[key] = val
                    ViLog.log("ViAB", "set AB: \(key) = \(String(describing: ViAB.config[key]))", .MINIMAL)
                    return
                }
            } else {
                ViAB.config[key] = possibleValues.last
                ViLog.log("ViAB", "set AB: \(key) = \(String(describing: ViAB.config[key]))", .MINIMAL)
                return
            }
        }
    }
}
