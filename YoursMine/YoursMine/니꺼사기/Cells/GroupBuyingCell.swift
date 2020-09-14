//
//  GroupBuyingCell.swift
//  YoursMine
//
//  Created by sutie on 2020/09/14.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class GroupBuyingCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var nParticipantLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var nLikeLabel: UILabel!
    @IBOutlet weak var nCommentLabel: UILabel!
    
    static let name = "GroupBuyingCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
