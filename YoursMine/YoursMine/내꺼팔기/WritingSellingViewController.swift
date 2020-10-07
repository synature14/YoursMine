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
    @IBOutlet var photoImages: [UIImageView]!
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
    }
    
    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func finishWriting(_ sender: UIButton) {
        
    }
    
    // 사진 고르기
    @IBAction func selectPhoto(_ sender: UIButton) {
        
    }
    
    
    
    
    static func create() -> WritingSellingViewController {
        let sb = UIStoryboard(name: "SellingTab", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WritingSellingViewController") as! WritingSellingViewController
        return vc
    }
}
