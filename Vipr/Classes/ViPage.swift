//
//  ViPage.swift
//  Pods
//
//  Created by iljn on 8/8/17.
//
//

import Foundation

public protocol ViPage {
    var header: ViNavbar { get }
    var cancelLabel: UILabel { get }
    var cancelButton: UIButton { get }
}

@available(iOS 8.2, *)
public extension ViPage where Self: UIViewController {
    
    func setupHeader(_ title: String) {
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80)
        _ = header.setupBlur(.dark)
        _ = header.setupTitle(title, .white)
        self.view.addSubview(header)
    }
    
    func setupCancelButton(_ action: Selector) {
        cancelLabel.frame = CGRect(x: 25,
                                   y: ViNavbar.cStatusBarHeight + 3,
                                   width: self.view.frame.width/3,
                                   height: ViNavbar.cNavbarHeight - ViNavbar.cStatusBarHeight)
        
        cancelLabel.textAlignment = .left
        cancelLabel.text = "Back"
        cancelLabel.textColor = .white
        cancelLabel.font = ViUtil.font(20, UIFontWeightMedium)
        cancelLabel.backgroundColor = .clear
        
        self.view.addSubview(cancelLabel)
        
        cancelButton.frame = CGRect(x: 25,
                                    y: ViNavbar.cStatusBarHeight + 3,
                                    width: self.view.frame.width/3 - 25,
                                    height: ViNavbar.cNavbarHeight - ViNavbar.cStatusBarHeight)
        cancelButton.backgroundColor = .clear
        cancelButton.addTarget(self, action: action, for: .touchUpInside)
        self.view.addSubview(cancelButton)
    }
}
