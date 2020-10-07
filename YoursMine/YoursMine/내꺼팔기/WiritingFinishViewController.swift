//
//  WiritingFinishViewController.swift
//  YoursMine
//
//  Created by hongjuyeon_dev on 2020/10/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class WiritingFinishViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    static func create() -> WiritingFinishViewController {
        let sb = UIStoryboard(name: "SellingTab", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WiritingFinishViewController") as! WiritingFinishViewController
        return vc
    }

}
