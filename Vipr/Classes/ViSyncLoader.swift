//
//  ViSyncLoader.swift
//  Pods
//
//  Created by iljn on 7/16/17.
//
//

import UIKit

open class ViSyncLoader: UIView {
    
    // MARK: Public Data
    // --------------------------------------------------------------------------
    open static var cShowLoadingIndicator :Bool = true
    open static var cBlurViewWidth :CGFloat = 120
    open static var cBlurViewHeight :CGFloat = 120
    open static var cBlurCornerRadius :CGFloat = 10
    open static var cActivityIndicatorScale :CGFloat = 2.0
    open static var cLabelHeight :CGFloat = 60
    
    // MARK: Subviews
    // --------------------------------------------------------------------------
    open var activityIndicator: UIActivityIndicatorView
    open var blurView: UIVisualEffectView
    open var label = UILabel()
    
    // MARK: Initialization
    // --------------------------------------------------------------------------
    public init (_ frame : CGRect, _ blurStyle: UIBlurEffectStyle = .dark, _ indicatorStyle: UIActivityIndicatorViewStyle = .white) {
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: indicatorStyle)
        blurView = ViUtil.blurView(blurStyle, 0, 0, ViSyncLoader.cBlurViewWidth, ViSyncLoader.cBlurViewHeight)
        super.init(frame : frame)
        _setupView()
    }
    
    override public init (frame : CGRect) {
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        blurView = ViUtil.blurView(.dark, 0, 0, ViSyncLoader.cBlurViewWidth, ViSyncLoader.cBlurViewHeight)
        super.init(frame : frame)
        _setupView()
    }
    
    convenience public init () {
        self.init(CGRect.zero)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    // MARK: Public Functions
    // --------------------------------------------------------------------------
    open func show() {
        self.startAnimating()
        self.isHidden = false
    }
    open func hide() {
        self.isHidden = true
        self.stopAnimating()
    }
    
    open func startAnimating() {
        self.activityIndicator.startAnimating()
    }
    open func stopAnimating() {
        self.activityIndicator.stopAnimating()
    }
    
    open func performAction(_ actionText: String,
                            _ action: @escaping () -> Any?,
                            _ onSuccess: @escaping (Any) -> (),
                            _ onFailure: @escaping () -> ()) {
        self.label.text = actionText
        if ViSyncLoader.cShowLoadingIndicator {
            self.show()
        }
        
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        queue.async {
            guard let result = action() else {
                DispatchQueue.main.sync {
                    onFailure()
                    self.hide()
                }
                return
            }
            DispatchQueue.main.sync {
                onSuccess(result)
                self.hide()
            }
        }
    }
    
    // MARK: Internal Functions
    // --------------------------------------------------------------------------
    private func _initView (_ blurStyle: UIBlurEffectStyle = .dark, _ indicatorStyle: UIActivityIndicatorViewStyle = .white) {
    
    }
    private func _setupView () {
        self.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
        
        blurView.center = self.center
        blurView.layer.cornerRadius = ViSyncLoader.cBlurCornerRadius
        blurView.layer.masksToBounds = true;
        self.addSubview(blurView)
        
        activityIndicator.scale(ViSyncLoader.cActivityIndicatorScale)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: blurView.frame.width, height: blurView.frame.height - ViSyncLoader.cLabelHeight/2)
        activityIndicator.startAnimating()
        blurView.addSubview(activityIndicator)
        
        label.frame = CGRect(x: 0, y: blurView.frame.height - ViSyncLoader.cLabelHeight,
                             width: blurView.frame.width, height: ViSyncLoader.cLabelHeight)
        label.textColor = .white
        if #available(iOS 8.2, *) {
            label.font = ViUtil.font(14, UIFontWeightMedium)
        } else {
            // Fallback on earlier versions
        }
        label.text = "loading..."
        label.textAlignment = .center
        blurView.addSubview(label)
    }
}
