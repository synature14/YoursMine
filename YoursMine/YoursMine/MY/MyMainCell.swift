
//
//  MyMainCell.swift
//  YoursMine
//
//  Created by SutieDev on 2020/10/14.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class MyMainCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        super.prepareForReuse()
    }
    
    func setTitle(_ name: String) {
        self.titleLabel.text = name
    }

}
