//
//  WritingSellingViewController.swift
//  YoursMine
//
//  Created by hongjuyeon_dev on 2020/10/06.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class WritingSellingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func create() -> WritingSellingViewController {
        let sb = UIStoryboard(name: "SellingTab", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WritingSellingViewController") as! WritingSellingViewController
        return vc
    }
}
