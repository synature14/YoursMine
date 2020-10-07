//
//  WritingSellingViewController.swift
//  YoursMine
//
//  Created by hongjuyeon_dev on 2020/10/06.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class WritingSellingViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var photoImage: UIImageView!
    @IBOutlet weak var txtFldTitle: UITextField!
    @IBOutlet weak var txtFldCnt: UITextField!
    @IBOutlet weak var txtFldPerson: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    var titleText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        titleLabel.text = (titleText ?? "재능판매") + "글쓰기"
        txtFldPerson.delegate = self
        txtFldCnt.delegate = self
        txtFldPerson.delegate = self
    }
    
    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func finishWriting(_ sender: UIButton) {
        
    }
    
    // 사진 고르기
    @IBAction func selectPhoto(_ sender: UIButton) {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imgPicker.sourceType = .photoLibrary
        imgPicker.allowsEditing = true
        self.present(imgPicker, animated: true, completion: nil)
    }
    
    
    static func create() -> WritingSellingViewController {
        let sb = UIStoryboard(name: "SellingTab", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WritingSellingViewController") as! WritingSellingViewController
        return vc
    }
}

extension WritingSellingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let img = info[.originalImage] as? UIImage else {
            return
        }
        photoImage.image = img
    }
}

extension WritingSellingViewController: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case txtFldCnt:
            txtFldCnt.text = (txtFldCnt.text ?? "") + " 회"
            
        case txtFldPerson:
            txtFldPerson.text = (txtFldPerson.text ?? "") + " 명"
            
        default :
            break
        }
        
        
        return true
    }
}
