//
//  ViPages.swift
//  Pods
//
//  Created by iljn on 6/21/17.
//
//

import UIKit

open class ViPages: ViViewController {

    // MARK: Public Data
    // --------------------------------------------------------------------------
    public var scrollView: UIScrollView = UIScrollView()
    public var pages: [UIViewController] = []
    public var currentPage: Int = 0

    // MARK: View Control
    // --------------------------------------------------------------------------
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
    }
    
    // MARK: Internal UI Initialization
    // --------------------------------------------------------------------------
    func setupScrollView() {
        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * 2, height: self.view.frame.size.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(self.scrollView)
    }
    
    // MARK: Public Functions
    // --------------------------------------------------------------------------
    open func addPage(_ page: UIViewController) {
        page.view.frame = CGRect(
            x: CGFloat(pages.count) * self.view.frame.size.width,
            y: 0,
            width: self.view.frame.size.width,
            height: self.view.frame.size.height)
        
        pages.append(page)
        self.addChildViewController(page)
        scrollView.addSubview(page.view)
        scrollView.contentSize = CGSize(
            width: self.view.frame.size.width * CGFloat(pages.count),
            height: self.view.frame.size.height)
    }
    
    open func scrollToPage(_ page: Int) {
        self.scrollView.setContentOffset(CGPoint(x: self.view.frame.width * CGFloat(page), y: 0), animated: true)
    }
    
    open func snapToPage(_ page: Int) {
        self.scrollView.setContentOffset(CGPoint(x: self.view.frame.width * CGFloat(page), y: 0), animated: false)
        currentPage = page
    }
}
