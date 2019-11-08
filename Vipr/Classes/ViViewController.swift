//
//  ViViewController.swift
//  Pods
//
//  Created by Sebastian Bierman-Lytle on 6/10/17.
//
//

import Foundation

open class ViViewController: UIViewController {
    
    open var palette: ViColorPalette?
    
    // MARK: View Control
    // --------------------------------------------------------------------------
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Subview Presentation
    // --------------------------------------------------------------------------
    open func presentAlert(_ title: String, _ message: String?) {
        self.present(ViAlert.info(title, message), animated: true, completion: nil)
    }
}
