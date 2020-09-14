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
        let auctionListCell = UINib(nibName: AuctionListCell.name, bundle: nil)
        tableView.register(auctionListCell, forCellReuseIdentifier: AuctionListCell.name)
        tableView.contentInset.bottom = 100
    }
    
}
extension AuctionListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let auctionListCell = tableView.dequeueReusableCell(withIdentifier: AuctionListCell.name, for: indexPath) as? AuctionListCell {
            return auctionListCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
