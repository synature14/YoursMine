//
//  MainViewController.swift
//  YoursMine
//
//  Created by SutieDev on 2020/09/03.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        showIntroVC()
    }

    // 인트로 화면 띄우기
    private func showIntroVC() {
        let introVC = IntroViewController.create()
        introVC.modalPresentationStyle = .overFullScreen
        self.present(introVC, animated: false, completion: nil)
    }
}

