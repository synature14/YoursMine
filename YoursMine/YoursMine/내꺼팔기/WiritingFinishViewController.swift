//
//  WiritingFinishViewController.swift
//  YoursMine
//
//  Created by hongjuyeon_dev on 2020/10/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

struct Selling {
    let title: String
    let image: UIImage
    let classCnt: String
    let personCnt: String
    let contextText: String
}

class WiritingFinishViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var classCntLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contextLabel: UILabel!
    
    var sellingData: Selling?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        imgView.image = sellingData?.image
        titleLabel.text = sellingData?.title
        contextLabel.text = sellingData?.contextText
        classCntLabel.text = String(format: "%@차 0명 / %@", sellingData?.classCnt ?? "", sellingData?.personCnt ?? "")
    }
    
    @IBAction func hide(_ sender: UIButton) {
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    
    static func create() -> WiritingFinishViewController {
        let sb = UIStoryboard(name: "SellingTab", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WiritingFinishViewController") as! WiritingFinishViewController
        return vc
    }

}
