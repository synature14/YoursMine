//
//  IntroViewController.swift
//  YoursMine
//
//  Created by hongjuyeon_dev on 2020/09/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Button Event
    // 로그인
    @IBAction private func goLogin(_ sender: UIButton) {
        
    }
    
    // 임직원 인증 / 비밀번호 재설정
    @IBAction private func goResetAuth(_ sender: Any) {
        let vc = TermsViewController.create()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Public Methods
    static func create() -> IntroViewController {
        let sb = UIStoryboard(name: "Auth", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "IntroViewController") as! IntroViewController
        return vc
    }
}
