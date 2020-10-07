
//
//  SellingViewController.swift
//  YoursMine
//
//  Created by hongjuyeon_dev on 2020/09/17.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class SellingViewController: UIViewController {
    
    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var tempView: UIView!
    
    private var sellingTxt = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        self.tempView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.35,
                       animations: {
                        self.selectView.transform = .identity
                        self.tempView.transform = .identity
        })
    }
    
    
    @IBAction func selectSelling(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            sellingTxt = "물품거래"
        case 1:
            sellingTxt = "재능판매"
        case 2:
            sellingTxt = "나눔경매"
        default:
            break
        }
        
        hide()
    }
    
    func hide() {
        UIView.animate(withDuration: 0.35,
                       animations: {
                        self.selectView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
                        self.tempView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        },
                       completion: { _ in
                        self.dismiss(animated: false, completion: {
                            let vc = WritingSellingViewController.create()
                            vc.titleText = self.sellingTxt
                            vc.modalPresentationStyle = .overFullScreen
                            UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
                            
                        })
        })
    }
    
    static func create() -> SellingViewController {
        let sb = UIStoryboard(name: "SellingTab", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SellingViewController") as! SellingViewController
        return vc
    }
}
