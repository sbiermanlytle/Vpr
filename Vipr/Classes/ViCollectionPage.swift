//
//  ViCollectionPage.swift
//  Pods
//
//  Created by iljn on 6/12/17.
//
//

import Foundation

open class ViCollectionPage: ViCollectionViewController<Any> {
    
    open var header: ViNavbar!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorLiteralRed: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        header = ViNavbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80))
        _ = header.setupBlur(.dark)
        let headerTitle = header.setupTitle("Vipr")
        headerTitle.textColor = .white
        self.view.addSubview(header)
    }
    
    // Mark: UICollectionView Delegate
    // --------------------------------------------------------------------------
    open override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        var _ : UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        ViLog.log("ViCollectionViewController", "selected \(indexPath.row)", .DEBUG);
    }
}

