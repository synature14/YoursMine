//
//  PatternLockViewController.swift
//  YoursMine
//
//  Created by hongjuyeon_dev on 2020/09/14.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class PatternLockViewController: UIViewController {

    @IBOutlet weak var patternContentView: UIView!
    private var gestureLock = CCGestureLock()
    
    var isLogin = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setupGestureLock()
    }
    
    private func initUI() {
        gestureLock = CCGestureLock(frame: patternContentView.bounds)
        patternContentView.addSubview(gestureLock)
    }
    
    private func setupGestureLock() {
        gestureLock.backgroundColor = .clear
        // Set number of sensors
        gestureLock.lockSize = (3, 3)
        
        // Sensor grid customisations
        gestureLock.edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        // Sensor point customisation (normal)
        gestureLock.setSensorAppearance(
            type: .inner,
            radius: 5,
            width: 1,
            color: .black,
            forState: .normal
        )
        gestureLock.setSensorAppearance(
            type: .outer,
            color: .clear,
            forState: .normal
        )
        
        // Sensor point customisation (selected)
        gestureLock.setSensorAppearance(
            type: .inner,
            radius: 3,
            width: 5,
            color: UIColor(named: "TextColor"),
            forState: .selected
        )
        gestureLock.setSensorAppearance(
            type: .outer,
            radius: 30,
            width: 5,
            color: UIColor(named: "PointYellowColor"),
            forState: .selected
        )
        
        // Sensor point customisation (wrong password)
        gestureLock.setSensorAppearance(
            type: .inner,
            radius: 3,
            width: 5,
            color: .red,
            forState: .error
        )
        gestureLock.setSensorAppearance(
            type: .outer,
            radius: 30,
            width: 5,
            color: .red,
            forState: .error
        )
        
        // Line connecting sensor points (normal/selected)
        [CCGestureLock.GestureLockState.normal, CCGestureLock.GestureLockState.selected].forEach { (state) in
            gestureLock.setLineAppearance(
                width: 5.5,
                color: UIColor(named: "TextColor")?.withAlphaComponent(0.5),
                forState: state
            )
        }
        
        // Line connection sensor points (wrong password)
        gestureLock.setLineAppearance(
            width: 5.5,
            color: UIColor.red.withAlphaComponent(0.5),
            forState: .error
        )
        
        gestureLock.addTarget(
            self,
            action: #selector(gestureComplete),
            for: .gestureComplete
        )
    }
    
    @objc func gestureComplete(gestureLock: CCGestureLock) {
        print("patternlock finish =======")
        
        self.dismiss(animated: false, completion: {
            UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
        })
    }
    
    @IBAction func goReRegisterAuth(_ sender: UIButton) {
        self.dismiss(animated: false, completion: {
            let vc = TermsViewController.create()
            vc.modalPresentationStyle = .overFullScreen
            UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
        })
    }
    
    
    static func create() -> PatternLockViewController {
        let sb = UIStoryboard(name: "Auth", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PatternLockViewController") as! PatternLockViewController
        return vc
    }

}
