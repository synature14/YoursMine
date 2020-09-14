//
//  GroupBuyingListController.swift
//  YoursMine
//
//  Created by sutie on 2020/09/10.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class GroupBuyingListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    static let name = "GroupBuyingListController"
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        let groupBuyingCell = UINib(nibName: GroupBuyingCell.name, bundle: nil)
        tableView.register(groupBuyingCell, forCellReuseIdentifier: GroupBuyingCell.name)
        tableView.contentInset.bottom = 100
    }
}

extension GroupBuyingListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let groupBuyingCell = tableView.dequeueReusableCell(withIdentifier: GroupBuyingCell.name, for: indexPath) as? GroupBuyingCell {
            return groupBuyingCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
