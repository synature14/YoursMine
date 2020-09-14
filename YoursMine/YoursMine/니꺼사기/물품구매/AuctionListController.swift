//
//  AuctionListController.swift
//  YoursMine
//
//  Created by sutie on 2020/09/10.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class AuctionListController: ItemListSuperController {
    private var itemArray: [Product] = []
    static let name = "AuctionListController"
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        let auctionListCell = UINib(nibName: AuctionListCell.name, bundle: nil)
        tableView.register(auctionListCell, forCellReuseIdentifier: AuctionListCell.name)
        tableView.contentInset.bottom = 100
    }
    
    override func setData(_ productArr: [Product]) {
        self.itemArray = productArr
    }
    
}
extension AuctionListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemArray[indexPath.row]
        
        if let auctionListCell = tableView.dequeueReusableCell(withIdentifier: AuctionListCell.name, for: indexPath) as? AuctionListCell {
            auctionListCell.setItem(item)
            return auctionListCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
