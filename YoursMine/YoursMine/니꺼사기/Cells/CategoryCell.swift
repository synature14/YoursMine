//
//  CategoryCell.swift
//  YoursMine
//
//  Created by sutie on 2020/09/10.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    static let name = "CategoryCell"
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var underLineView: UIView!
    
    private var category: Category!
    
    func setCategory(_ category: Category) {
        self.category = category
        
        categoryLabel.text = category.title
        
        if category.didSelected {
            underLineView.isHidden = false
        } else {
            underLineView.isHidden = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
}
