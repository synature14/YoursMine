//
//  MyMainViewController.swift
//  YoursMine
//
//  Created by SutieDev on 2020/10/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class MyMainViewController: UIViewController {
    var pageVC: BuyPageViewController!
    var searchingLocationIndex: Int = 1

    @IBOutlet weak var 판매내역Label: UILabel!
    @IBOutlet weak var 구매내역Label: UILabel!
    
    @IBOutlet weak var underlineView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

extension MyMainViewController: PageIndexDelegate {
    func selectMenuItem(pageIndex: Int) {
        if pageIndex == 0 {
            판매내역Label.textColor = #colorLiteral(red: 0.2156862745, green: 0.137254902, blue: 0.03529411765, alpha: 1)
            구매내역Label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        } else {
            판매내역Label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            구매내역Label.textColor = #colorLiteral(red: 0.2156862745, green: 0.137254902, blue: 0.03529411765, alpha: 1)
        }
    }
}
