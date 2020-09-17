
//
//  SellingViewController.swift
//  YoursMine
//
//  Created by hongjuyeon_dev on 2020/09/17.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class SellingViewController: UIViewController {
    
    @IBOutlet weak var selectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    private func initUI() {
        show()
    }
    
    
    @IBAction func selectSelling(_ sender: UIButton) {
        hide()
    }
    
    func show() {
        self.selectView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        
        UIView.animate(withDuration: 0.35,
                       animations: {
                        self.selectView.transform = .identity },
                       completion: nil)
    }
    
    func hide() {
        UIView.animate(withDuration: 0.35,
                       animations: { self.selectView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height) },
                       completion: { _ in
                        self.dismiss(animated: false, completion: nil) })
    }
    
    static func create() -> SellingViewController {
        let sb = UIStoryboard(name: "SellingTab", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SellingViewController") as! SellingViewController
        return vc
    }
}
