//
//  MyMainViewController.swift
//  YoursMine
//
//  Created by SutieDev on 2020/10/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class MyMainViewController: UIViewController {
    var pageVC: MyPageController!
    var searchingLocationIndex: Int = 1

    @IBOutlet weak var 판매내역Label: UILabel!
    @IBOutlet weak var 구매내역Label: UILabel!
    
    @IBOutlet weak var underlineView01: UIView!
    @IBOutlet weak var underlineView02: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pageVC = self.children[0] as? MyPageController {
            self.pageVC = pageVC
            self.pageVC.pageDelegate = self
            
            underlineView02.isHidden = true
            
//            self.pageVC.itemArray = productArr
            
            for i in 0...1 {
                if let listVC = pageVC.VCArray[i] as? MyHistorySuperController {
//                    let filetered = filterItems(category: ProductCategory(rawValue: "\(i)") ?? .물건)
//                    listVC.setData(filetered)
                }
            }
        }
    }
    
    @IBAction func 판매내역ButtonTapped(_ sender: Any) {
        pageVC.goToViewController(0)
    }
    
    @IBAction func 구매내역ButtonTapped(_ sender: Any) {
        pageVC.goToViewController(1)
    }
    
    
}

extension MyMainViewController: PageIndexDelegate {
    func selectMenuItem(pageIndex: Int) {
        if pageIndex == 0 {
            판매내역Label.textColor = #colorLiteral(red: 0.2156862745, green: 0.137254902, blue: 0.03529411765, alpha: 1)
            구매내역Label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            underlineView01.isHidden = false
            underlineView02.isHidden = true
            
        } else {
            판매내역Label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            구매내역Label.textColor = #colorLiteral(red: 0.2156862745, green: 0.137254902, blue: 0.03529411765, alpha: 1)
            underlineView01.isHidden = true
            underlineView02.isHidden = false
        }
    }
}
