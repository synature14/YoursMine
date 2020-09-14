//
//  LessonsListCell.swift
//  YoursMine
//
//  Created by sutie on 2020/09/11.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class LessonsListCell: UITableViewCell {

    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var badgeLabelView: UILabel!
    @IBOutlet weak var popularView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var nLikeLabel: UILabel!
    @IBOutlet weak var nCommentLabel: UILabel!
    
    static let name = "LessonsListCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setItem(_ item: Product) {
        titleLabel.text = item.itemContent.explain
        userNameLabel.text = item.sellerID
        
        nLikeLabel.text = item.nLikes
        nCommentLabel.text = item.nChattings
    }
}
