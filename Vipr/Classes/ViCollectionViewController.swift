//
//  ViCollectionViewController.swift
//  Pods
//
//  Created by Sebastian Bierman-Lytle on 6/12/17.
//
//

import UIKit

open class ViCollectionViewController<T>: ViViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout   {
    
    // MARK: Public Data
    // --------------------------------------------------------------------------
    open var items: [T] = []
    
    open lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CVCCell")
        cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CVSectionHeader")
        return cv
    }()
    
    // MARK: View Control
    // --------------------------------------------------------------------------
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(self.collectionView)
    }
    
    
    // MARK: UICollectionViewDelegateFlowLayout
    // --------------------------------------------------------------------------
    open func collectionView(_ collectionView: UICollectionView,
                                      layout collectionViewLayout: UICollectionViewLayout,
                                      sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2, height: 200)
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    // MARK: CollectionView Supplementary Views
    // --------------------------------------------------------------------------
    open func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: ViNavbar.cNavbarHeight)
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        //switch kind {
        //case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CVSectionHeader", for: indexPath)
            headerView.backgroundColor = .clear
            return headerView
            
        //case UICollectionElementKindSectionFooter:
            //let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CVSectionFooter", for: indexPath)
            
            //footerView.backgroundColor = .green
            //return footerView
            
        //default:
        //    ViLog.log("ViCollectionViewController", "unexpected kind of UICollectionReusableView", .VERBOSE);
        //}
        //let v: UICollectionReusableView
        //return v
    }
    
    // MARK: UICollectionViewControllerDataSource
    // --------------------------------------------------------------------------
    open func collectionView(_ collectionView: UICollectionView,
                             numberOfItemsInSection section: Int) -> Int{
        return items.count
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCCell", for: indexPath)
        cell.backgroundColor = UIColor.random()
        return cell
    }
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        var _ : UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        ViLog.log("ViCollectionViewController", "selected \(indexPath.row)", .DEBUG);
    }
}
