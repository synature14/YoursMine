//
//  TermsViewController.swift
//  YoursMine
//
//  Created by hongjuyeon_dev on 2020/09/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Button Event
    @IBAction private func close(_ sender: UIButton) {
        hide()
    }
    
    // MARK: - Public Methods
    func hide() {
        self.dismiss(animated: true, completion: nil)
    }
    
    static func create() -> TermsViewController {
        let sb = UIStoryboard(name: "Auth", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TermsViewController") as! TermsViewController
        return vc
    }
    
}
