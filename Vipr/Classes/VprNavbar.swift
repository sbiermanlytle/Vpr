//
//  VprNavbar.swift
//  Pods
//
//  Created by Sebastian Bierman-Lytle on 6/4/17.
//
//

import UIKit

public class VprNavbar: UIView {
    
    // MARK: Public Data
    // --------------------------------------------------------------------------
    static var kStatusBarHeight:CGFloat = 20
    
    // MARK: Initialization
    // --------------------------------------------------------------------------
    override public init (frame : CGRect) {
        super.init(frame : frame)
        _setupView()
    }
    
    convenience public init () {
        self.init(frame:CGRect.zero)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    // MARK: Optional UI Components
    // --------------------------------------------------------------------------
    
    public func standardSetup(_ title: String = "Vipr") {
        _ = setupBlur()
        _ = setupBorder()
        _ = setupTitle(title)
    }
    
    public func setupBorder(_ width: CGFloat = 1.0) -> CALayer {
        let border = CALayer()
        border.borderColor = UIColor(colorLiteralRed: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        return border
    }
    
    public func setupBlur(_ style: UIBlurEffectStyle = UIBlurEffectStyle.light) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = CGRect(x: 0, y: 0,
                                      width: self.frame.width,
                                      height: self.frame.height)
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        self.sendSubview(toBack: blurEffectView)
        return blurEffectView
    }
    
    public func setupTitle (_ text: String = "Vipr") -> UILabel {
        let title: UILabel = UILabel()
        title.frame = CGRect(x: 0,
                             y: VprNavbar.kStatusBarHeight + 6,
                             width: self.frame.width,
                             height: self.frame.size.height - VprNavbar.kStatusBarHeight - 6)
        title.text = text
        title.textAlignment = .center
        title.textColor = UIColor(colorLiteralRed: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        if #available(iOS 8.2, *) {
            title.font = UIFont.systemFont(ofSize: 26, weight: UIFontWeightBold)
        } else {
            // Fallback on earlier versions
        }
        self.addSubview(title)
        return title
    }
    
    // MARK: Internal Functions
    // --------------------------------------------------------------------------
    
    func _setupView () {
    }
}
