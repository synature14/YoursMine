//
//  AuctionListCell.swift
//  YoursMine
//
//  Created by sutie on 2020/09/14.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class AuctionListCell: UITableViewCell {
    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    static let name = "AuctionListCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setItem(_ item: Product) {
        titleLabel.text = item.itemContent.explain
        userNameLabel.text = item.sellerID
        priceLabel.text = item.price + "원"
        previewImageView.image = UIImage(named: item.itemContent.image ?? "")
    }

}
