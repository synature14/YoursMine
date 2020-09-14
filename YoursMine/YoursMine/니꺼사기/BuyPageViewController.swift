//
//  BuyPageViewController.swift
//  YoursMine
//
//  Created by sutie on 2020/09/10.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

protocol PageIndexDelegate {
    func selectMenuItem(pageIndex: Int)
}

class BuyPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var itemArray: [Product] = []
    var pageDelegate: PageIndexDelegate?
    var currentIndex: Int {
        didSet {
            self.pageDelegate?.selectMenuItem(pageIndex: currentIndex)
        }
    }
    
    lazy var VCArray: [UIViewController] = {
        return [self.VCInstance(name: ProductListController.name),
                self.VCInstance(name: LessonsListController.name),
                self.VCInstance(name: AuctionListController.name),
                self.VCInstance(name: GroupBuyingListController.name)]
    }()

    required init?(coder aDecoder: NSCoder) {
        self.currentIndex = 0
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "BuyingTab", bundle: nil).instantiateViewController(identifier: name)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = VCArray.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = VCArray.firstIndex(of: viewController) else { return nil }
        let previousIndex = vcIndex - 1
        if previousIndex < 0 {
            return VCArray.last
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
            return VCArray.first
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

extension BuyPageViewController {
    func goToViewController(_ index: Int) {
        var direction: UIPageViewController.NavigationDirection = .forward
        if index < currentIndex {
            direction = .reverse
        }
        self.setViewControllers([VCArray[index]], direction: direction, animated: true)
        self.currentIndex = index
    }
}
