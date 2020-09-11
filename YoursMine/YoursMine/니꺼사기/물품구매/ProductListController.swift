//
//  ProductListController.swift
//  YoursMine
//
//  Created by sutie on 2020/09/10.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class ProductListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    static let name = "ProductListController"
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        let itemListCell = UINib(nibName: ItemListCell.name, bundle: nil)
        tableView.register(itemListCell, forCellReuseIdentifier: ItemListCell.name)
        tableView.estimatedRowHeight = 110
    }
}

extension ProductListController: UITableViewDataSource, UITableViewDelegate {
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
