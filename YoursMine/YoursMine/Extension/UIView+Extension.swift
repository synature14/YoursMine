//
//  UIView+Extension.swift
//  YoursMine
//
//  Created by hongjuyeon_dev on 2020/09/07.
//  Copyright © 2020 developers. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    // 원하는 부분에 라운드 적용
    @objc func setCornerRadius(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        self.layer.masksToBounds = true
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    

    // 해당 view의 subview를 찾아 background color clear 처리
    func clearBackgrounds() {
        self.backgroundColor = .clear
        for subview in self.subviews {
            subview.clearBackgrounds()
        }
    }
    
    enum ViewSide {
        case left, right, top, bottom
    }
    
    func addBorder(toSide sides: [ViewSide], withColor color: CGColor, andThickness thickness: CGFloat) {
        
        for side in sides {
            let border = CALayer()
            border.backgroundColor = color
            
            switch side {
            case .left:
                border.frame = CGRect(x: 0.0, y: 0.0, width: thickness, height: frame.height)
            case .right:
                border.frame = CGRect(x: UIScreen.main.bounds.width - frame.minX, y: 0.0, width: thickness, height: frame.height)
            case .top:
                border.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: thickness)
            case .bottom:
                border.frame = CGRect(x: 0.0, y: frame.height-thickness, width: frame.width, height: thickness)
            }
            
            layer.addSublayer(border)
        }
    }
    
    @objc func removeAllSubviews() {
        for vi in self.subviews {
            vi.removeFromSuperview()
        }
    }

}
