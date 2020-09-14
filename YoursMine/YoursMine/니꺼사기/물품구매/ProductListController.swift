//
//  ProductListController.swift
//  YoursMine
//
//  Created by sutie on 2020/09/10.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class ProductListController: ItemListSuperController {

    @IBOutlet weak var tableView: UITableView!
    private var itemArray: [Product] = []
    
    static let name = "ProductListController"
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        let itemListCell = UINib(nibName: ItemListCell.name, bundle: nil)
        tableView.register(itemListCell, forCellReuseIdentifier: ItemListCell.name)
        tableView.estimatedRowHeight = 80
        tableView.contentInset.bottom = 100
    }
    
    override func setData(_ productArr: [Product]) {
        self.itemArray = productArr
    }
}

extension ProductListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemArray[indexPath.row]
        
        if let itemListCell = tableView.dequeueReusableCell(withIdentifier: ItemListCell.name, for: indexPath) as? ItemListCell {
            itemListCell.setItem(item)
            return itemListCell
        }
        
        return UITableViewCell()
    }
}
