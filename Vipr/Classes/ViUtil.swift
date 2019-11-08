//
//  ViUtil.swift
//  Pods
//
//  Created by iljn on 6/21/17.
//
//

import UIKit

public struct ViUtil {
    
    public static func font(_ size: CGFloat, _ weight: CGFloat) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
        return UIFont(name: "Helvetica", size: size)!
    }
    
    public static func monospaceFont(_ size: CGFloat, weight: CGFloat) -> UIFont {
        if #available(iOS 9.0, *) {
            return UIFont.monospacedDigitSystemFont(ofSize: size, weight: weight)
        }
        return UIFont(name: "Helvetica", size: size)!
    }
    
    public static func blurView(_ style: UIBlurEffectStyle = .dark,
                                _ x:CGFloat = 0, _ y:CGFloat = 0,
                                _ width:CGFloat = 0, _ height:CGFloat = 0) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = CGRect(x: x, y: y, width: width, height: height)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }
    
    public static func formatNumber(_ value: Double, _ decimals: Int) -> String {
        let formatter = NumberFormatter()
        if decimals > 0 {
            formatter.numberStyle = NumberFormatter.Style.decimal
            //formatter.usesSignificantDigits = true
            //formatter.minimumSignificantDigits = 2
            formatter.minimumFractionDigits = decimals
            formatter.maximumFractionDigits = decimals
        }
        return formatter.string(from: (value) as NSNumber)!
    }
    
    public static func formatMoney(_ value: Double) -> String {
        if value < 0 {
            return "- $" + ViUtil.formatNumber(value * -1, 2)
        } else {
            return "$" + ViUtil.formatNumber(value, 2)
        }
    }
    
    public static func safeDiv(_ input:Float, divisor:Float) -> Float {
        if divisor == 0 {
            return input
        }
        return input / divisor;
    }
}
