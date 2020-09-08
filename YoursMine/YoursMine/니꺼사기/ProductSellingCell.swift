//
//  ProductSellingCell.swift
//  YoursMine
//
//  Created by SutieDev on 2020/09/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class ProductSellingCell: UICollectionViewCell {
    static let name = "ProductSellingCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        let itemListCell = UINib(nibName: ItemListCell.name, bundle: nil)
        tableView.register(itemListCell, forCellReuseIdentifier: ItemListCell.name)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}

extension ProductSellingCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let itemListCell = tableView.dequeueReusableCell(withIdentifier: ItemListCell.name, for: indexPath) as? ItemListCell {
            return itemListCell
        }
        
        return UITableViewCell()
    }
    
    
}
