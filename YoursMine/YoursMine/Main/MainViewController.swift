//
//  MainViewController.swift
//  YoursMine
//
//  Created by SutieDev on 2020/09/03.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tabBarView: UIView!
    
    @IBOutlet weak var buyingContainerView: UIView!
    @IBOutlet weak var sellingContainerView: UIView!
    @IBOutlet weak var chattingContainerView: UIView!
    @IBOutlet weak var myMainContainerView: UIView!
    
    @IBOutlet weak var buyingTabLabel: UILabel!
    @IBOutlet weak var sellingTabLabel: UILabel!
    @IBOutlet weak var chattingTabLabel: UILabel!
    @IBOutlet weak var myTabLabel: UILabel!
    
    private let tabOnColor = #colorLiteral(red: 1, green: 0.9294117647, blue: 0.768627451, alpha: 1)
    private let tabOffColor = UIColor.lightGray
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showIntroVC()
        
        sellingContainerView.isHidden = true
        chattingContainerView.isHidden = true
        myMainContainerView.isHidden = true
        buyingContainerView.isHidden = false
    }

    // 인트로 화면 띄우기
    private func showIntroVC() {
        let introVC = IntroViewController.create()
        introVC.modalPresentationStyle = .overFullScreen
        self.present(introVC, animated: false, completion: nil)
    }
    
    // 탭바 숨기기
    func hideTabBar() {
        self.tabBarView.isHidden = true
        self.view.backgroundColor = UIColor(named: "PointYellowColor")
    }
    
    func showTabBar() {
        self.tabBarView.isHidden = false
        self.view.backgroundColor = .white
    }
    
    
    @IBAction func tabBarSelect(_ sender: UIButton) {
        resetTabLabels()
        
        switch sender.tag {
        case 0: // 니꺼사기
            sellingContainerView.isHidden = true
            chattingContainerView.isHidden = true
            myMainContainerView.isHidden = true
            buyingContainerView.isHidden = false
            
            buyingTabLabel.textColor = tabOnColor
            
        case 1: // 내꺼팔기
            let vc = SellingViewController.create()
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: {
//                buyingContainerView.isHidden = true
//                chattingContainerView.isHidden = true
//                myMainContainerView.isHidden = true
//
//                sellingContainerView.isHidden = false
            })
            
            sellingTabLabel.textColor = tabOnColor
            
        case 2: // 채팅
            buyingContainerView.isHidden = true
            sellingContainerView.isHidden = true
            myMainContainerView.isHidden = true
            
            chattingContainerView.isHidden = false
            
            chattingTabLabel.textColor = tabOnColor
            
        case 3: // MY
            buyingContainerView.isHidden = true
            sellingContainerView.isHidden = true
            chattingContainerView.isHidden = true
            
            myMainContainerView.isHidden = false
            
            myTabLabel.textColor = tabOnColor
        default:
            break
        }
        
    }
    
    private func resetTabLabels() {
        buyingTabLabel.textColor = tabOffColor
        sellingTabLabel.textColor = tabOffColor
        chattingTabLabel.textColor = tabOffColor
        myTabLabel.textColor = tabOffColor
        
        buyingTabLabel.font = UIFont(name: "NanumBarunGothic", size: 15.0)
        sellingTabLabel.font = UIFont(name: "NanumBarunGothic", size: 15.0)
        chattingTabLabel.font = UIFont(name: "NanumBarunGothic", size: 15.0)
        myTabLabel.font = UIFont(name: "NanumBarunGothic", size: 15.0)
    }
    
    static func create() -> MainViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        return vc
    }
    
}

