//
//  TermsViewController.swift
//  YoursMine
//
//  Created by hongjuyeon_dev on 2020/09/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
    
    @IBOutlet weak var aniViewtotAgreement: AnimationView!
    @IBOutlet var aniViewAgreements: [AnimationView]!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnTotAgreement: UIButton!
    @IBOutlet var btnAgreements: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    // MARK: - Private Methods
    private func initUI() {
        setInitAnimationView(animationView: aniViewtotAgreement)
        aniViewAgreements.forEach { self.setInitAnimationView(animationView: $0) }
        
        btnNext.isEnabled = false
        btnNext.backgroundColor = #colorLiteral(red: 0.8530235887, green: 0.8479533195, blue: 0.856921494, alpha: 1)
        btnNext.setTitleColor(.white, for: .normal)
    }
    
    private func setInitAnimationView(animationView: AnimationView) {
        animationView.animation = Animation.named("checkbox")
        animationView.contentMode = .scaleToFill
        animationView.backgroundBehavior = .stop
    }
    
    @objc private func playAnimation(_ sender: UIButton) {
        sender.isSelected = !(sender.isSelected)
        
        if sender.isSelected {
            aniViewtotAgreement.play()
        } else {
            aniViewtotAgreement.stop()
        }
    }
    
    private func setNextBtnEnabled() {
        if btnAgreements[0].isSelected && btnAgreements[1].isSelected {
            btnNext.isEnabled = true
            btnNext.backgroundColor = UIColor(named: "PointYellowColor")
            btnNext.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        }
        else {
            btnNext.isEnabled = false
            btnNext.backgroundColor = #colorLiteral(red: 0.8530235887, green: 0.8479533195, blue: 0.856921494, alpha: 1)
            btnNext.setTitleColor(.white, for: .normal)
        }
    }
    
    // MARK: - Button Event
    @IBAction func agreementOnTerms(_ sender: UIButton) {
        switch sender.tag {
        // 전체동의
        case 100:
            sender.isSelected = !(sender.isSelected)
            btnAgreements.forEach { $0.isSelected = !($0.isSelected) }
            
            DispatchQueue.main.async {
                if sender.isSelected {
                    self.aniViewtotAgreement.play()
                    self.aniViewAgreements.forEach { $0.play() }
                } else {
                    self.aniViewtotAgreement.stop()
                    self.aniViewAgreements.forEach { $0.stop() }
                }
            }
            
        // 서비스 이용 준수 사항 확인
        case 200:
            sender.isSelected = !(sender.isSelected)
            
            DispatchQueue.main.async {
                if self.btnTotAgreement.isSelected {
                    self.aniViewtotAgreement.stop()
                }
                
                if sender.isSelected {
                    self.aniViewAgreements[0].play()
                } else {
                    self.aniViewAgreements[0].stop()
                }
            }
            
        // 개인정보 수집 및 이용 동의
        case 300:
            sender.isSelected = !(sender.isSelected)
            
            DispatchQueue.main.async {
                if self.btnTotAgreement.isSelected {
                    self.aniViewtotAgreement.stop()
                }
                
                if sender.isSelected {
                    self.aniViewAgreements[1].play()
                } else {
                    self.aniViewAgreements[1].stop()
                }
            }
            
        // Push 알림 메시지 수신 동의
        case 400:
            sender.isSelected = !(sender.isSelected)
            
            DispatchQueue.main.async {
                if self.btnTotAgreement.isSelected {
                    self.aniViewtotAgreement.stop()
                }
                
                if sender.isSelected {
                    self.aniViewAgreements[2].play()
                } else {
                    self.aniViewAgreements[2].stop()
                }
            }
            
        default:
            break
        }
        
        self.setNextBtnEnabled()
    }
    
    
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
