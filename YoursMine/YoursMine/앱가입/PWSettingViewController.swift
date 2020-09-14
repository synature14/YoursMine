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
            }
            
        case 200:
            DispatchQueue.main.async {
                self.aniViewPattern.stop()
                self.aniViewPW.play()
                
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
        
    }
    
    
    
    static func create() -> PWSettingViewController {
        let sb = UIStoryboard(name: "Auth", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PWSettingViewController") as! PWSettingViewController
        return vc
    }
}
