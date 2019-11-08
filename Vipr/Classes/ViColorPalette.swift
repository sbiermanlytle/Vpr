//
//  ViColorPalette.swift
//  Pods
//
//  Created by iljn on 7/25/17.
//
//

import Foundation

open class ViColorPalette: NSObject {
    
    open var primary: UIColor
    
    // MARK: Initialize Function
    // --------------------------------------------------------------------------
    convenience override init() {
        self.init(primary: .black)
    }
    
    public init(primary p: UIColor) {
        self.primary = p
        super.init()
    }
}
