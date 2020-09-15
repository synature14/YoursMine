//
//  ItemListCell.swift
//  YoursMine
//
//  Created by SutieDev on 2020/09/08.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class ItemListCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var sellerIDLabel: UILabel!
    @IBOutlet weak var nLikesLabel: UILabel!
    @IBOutlet weak var nCommentLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    static let name = "ItemListCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setBackgroundColor(_ color: UIColor) {
        cellView.backgroundColor = color
    }
    
    func setItem(_ item: Product) {
        itemTitleLabel.text = item.itemContent.explain
        sellerIDLabel.text = item.sellerID
        
        priceLabel.text = item.price + "원"
        nLikesLabel.text = item.nLikes
        nCommentLabel.text = item.nChattings
    }
}
