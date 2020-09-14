//
//  PWSettingViewController.swift
//  YoursMine
//
//  Created by hongjuyeon_dev on 2020/09/11.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class PWSettingViewController: UIViewController {

    @IBOutlet weak var aniViewPattern: AnimationView!
    @IBOutlet weak var aniViewPW: AnimationView!
    @IBOutlet weak var btnFinish: UIButton!
    @IBOutlet weak var pwView: UIView!
    @IBOutlet weak var txtFldPw: UITextField!
    
    private var isPatternSelected = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    private func initUI() {
        setInitAnimationView(animationView: aniViewPattern)
        setInitAnimationView(animationView: aniViewPW)
        
        self.aniViewPattern.play()
        self.aniViewPW.stop()
        
        pwView.isHidden = true
    }
    
    private func setInitAnimationView(animationView: AnimationView) {
        animationView.animation = Animation.named("checkbox")
        animationView.contentMode = .scaleToFill
        animationView.backgroundBehavior = .stop
    }
    
    @IBAction func selectLogin(_ sender: UIButton) {
        sender.isSelected = !(sender.isSelected)
        
        switch sender.tag {
        case 100:
            DispatchQueue.main.async {
                self.aniViewPattern.play()
                self.aniViewPW.stop()
                
                self.pwView.isHidden = true
                self.txtFldPw.resignFirstResponder()
                
                self.isPatternSelected = true
            }
            
        case 200:
            DispatchQueue.main.async {
                self.aniViewPattern.stop()
                self.aniViewPW.play()
                
                self.pwView.isHidden = false
                self.txtFldPw.delegate = self
                self.txtFldPw.becomeFirstResponder()
                
                self.isPatternSelected = false
            }
            
        default:
            break
        }
        
        btnFinish.isEnabled = true
        btnFinish.backgroundColor = UIColor(named: "PointYellowColor")
        btnFinish.setTitleColor(UIColor(named: "TextColor"), for: .normal)
    }
    
    @IBAction func goNext(_ sender: UIButton) {
        if isPatternSelected {
            let vc = PatternLockViewController.create()
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
        }
        else {
            UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: {
                self.dismiss(animated: false, completion: nil)
            })
        }
    }
    
    
    static func create() -> PWSettingViewController {
        let sb = UIStoryboard(name: "Auth", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PWSettingViewController") as! PWSettingViewController
        return vc
    }
}

extension PWSettingViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        
        if !isPatternSelected {
            if let pw = txtFldPw.text, pw.count > 0 {
                btnFinish.isEnabled = true
                btnFinish.backgroundColor = UIColor(named: "PointYellowColor")
                btnFinish.setTitleColor(UIColor(named: "TextColor"), for: .normal)
            }
//            else {
//                btnFinish.isEnabled = false
//                btnFinish.backgroundColor = #colorLiteral(red: 0.8530235887, green: 0.8479533195, blue: 0.856921494, alpha: 1)
//                btnFinish.setTitleColor(.white, for: .normal)
//            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            
        case self.txtFldPw:
            self.txtFldPw.resignFirstResponder()
            
        default:
            break
        }
        
        return true
    }
}
