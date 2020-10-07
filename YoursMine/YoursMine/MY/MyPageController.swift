//
//  MyPageController.swift
//  YoursMine
//
//  Created by SutieDev on 2020/10/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class MyPageController: UIPageViewController {
    var itemArray: [Product] = []
    var pageDelegate: PageIndexDelegate?
    var currentIndex: Int = 0 {
        didSet {
            self.pageDelegate?.selectMenuItem(pageIndex: currentIndex)
        }
    }
    
    lazy var VCArray: [UIViewController] = {
        return [self.VCInstance(name: SellingHistoryController.name),
                self.VCInstance(name: BuyingHistoryController.name)]
    }()
    
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "MyMain", bundle: nil).instantiateViewController(identifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
    }

}

extension MyPageController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = VCArray.firstIndex(of: viewController) else { return nil }
        let previousIndex = vcIndex - 1
        if previousIndex < 0 {
            return nil
        } else {
            return VCArray[previousIndex]
        }
        
        self.pageDelegate?.selectMenuItem(pageIndex: vcIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = VCArray.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = vcIndex + 1
        if nextIndex >= VCArray.count {
            return nil
        } else {
            return VCArray[nextIndex]
        }
        
        self.pageDelegate?.selectMenuItem(pageIndex: vcIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
                let index = VCArray.firstIndex(of: currentViewController) {
                self.currentIndex = index                
            }
        }
    }
}
