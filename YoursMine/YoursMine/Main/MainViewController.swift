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
        switch sender.tag {
        case 0: // 니꺼사기
            sellingContainerView.isHidden = true
            chattingContainerView.isHidden = true
            myMainContainerView.isHidden = true
            buyingContainerView.isHidden = false
            
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
            
        case 2: // 채팅
            buyingContainerView.isHidden = true
            sellingContainerView.isHidden = true
            myMainContainerView.isHidden = true
            
            chattingContainerView.isHidden = false
            
        case 3: // MY
            buyingContainerView.isHidden = true
            sellingContainerView.isHidden = true
            chattingContainerView.isHidden = true
            
            myMainContainerView.isHidden = false
        default:
            break
        }
        
    }
    
}

