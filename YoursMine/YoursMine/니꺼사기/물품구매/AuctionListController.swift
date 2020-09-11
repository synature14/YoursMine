//
//  AuctionListController.swift
//  YoursMine
//
//  Created by sutie on 2020/09/10.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class AuctionListController: UIViewController {
    static let name = "AuctionListController"
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        let itemListCell = UINib(nibName: ItemListCell.name, bundle: nil)
        tableView.register(itemListCell, forCellReuseIdentifier: ItemListCell.name)
        tableView.estimatedRowHeight = 80
    }
    
}
extension AuctionListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let itemListCell = tableView.dequeueReusableCell(withIdentifier: ItemListCell.name, for: indexPath) as? ItemListCell {
            itemListCell.setBackgroundColor(.blue)
            return itemListCell
        }
        
        return UITableViewCell()
    }
}
