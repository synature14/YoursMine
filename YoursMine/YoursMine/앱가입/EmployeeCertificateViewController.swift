//
//  EmployeeCertificateViewController.swift
//  YoursMine
//
//  Created by hongjuyeon_dev on 2020/09/08.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class EmployeeCertificateViewController: UIViewController {

    @IBOutlet weak var pickerCompany: UIPickerView!
    @IBOutlet weak var txtFldemplyoeeNum: UITextField!
    @IBOutlet weak var txtFldPw: UITextField!
    @IBOutlet weak var lblSelectedCompanyName: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    
    private var arrCompany = [Company.하나금융지주.rawValue, Company.하나은행.rawValue, Company.하나카드.rawValue,
                              Company.하나금융투자.rawValue, Company.하나생명.rawValue, Company.하나금융티아이.rawValue,
                              Company.하나캐피탈.rawValue, Company.하나손해보험.rawValue, Company.하나선물.rawValue, Company.하나자산신탁.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func initUI() {
        txtFldemplyoeeNum.delegate = self
        txtFldPw.delegate = self
        pickerCompany.isHidden = true
        lblSelectedCompanyName.text = arrCompany.first ?? ""
        btnNext.setTitleColor(.lightGray, for: .normal)
        btnNext.isEnabled = false
    }
    
    static func create() -> EmployeeCertificateViewController {
        let sb = UIStoryboard(name: "Auth", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "EmployeeCertificateViewController") as! EmployeeCertificateViewController
        return vc
    }
    
    
    @IBAction func selectCompany(_ sender: UIButton) {
        sender.isSelected = !(sender.isSelected)
        
        if sender.isSelected {
            UIView.animate(withDuration: 0.35, animations: {
                self.pickerCompany.isHidden = false
            })
        }
        else {
            UIView.animate(withDuration: 0.35, animations: {
                self.pickerCompany.isHidden = true
            })
        }
    }
    
    @IBAction func goNext(_ sender: UIButton) {
        let vc = PWSettingViewController.create()
        // push해야하는데 일단 present
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

extension EmployeeCertificateViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrCompany.count
    }
}

extension EmployeeCertificateViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let companyName = arrCompany[row]
        let attStr = NSMutableAttributedString(string: companyName, attributes: [.font: UIFont(name: "NanumBarunGothic", size: 17.0)!,
                                                                                 .foregroundColor: UIColor(white: 0.0, alpha: 1.0) ])
        return attStr
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickerCompany.selectRow(row, inComponent: 0, animated: true)
        self.lblSelectedCompanyName.text = arrCompany[row]
    }
}

extension EmployeeCertificateViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        
        if let pw = txtFldPw.text, let num = txtFldemplyoeeNum.text, let company = lblSelectedCompanyName.text {
            if pw.count > 0 && num.count > 0 && company.count > 0 {
                btnNext.setTitleColor(.black, for: .normal)
                btnNext.isEnabled = true
            } else {
                btnNext.setTitleColor(.lightGray, for: .normal)
                btnNext.isEnabled = false
            }
        }
        else {
            btnNext.setTitleColor(.lightGray, for: .normal)
            btnNext.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.txtFldemplyoeeNum:
            self.txtFldemplyoeeNum.resignFirstResponder()
            self.txtFldPw.becomeFirstResponder()
            
        case self.txtFldPw:
            self.txtFldPw.resignFirstResponder()
            
        default:
            break
        }
        
        return true
    }
}
