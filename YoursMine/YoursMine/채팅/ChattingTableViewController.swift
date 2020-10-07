//
//  ChattingTableViewController.swift
//  YoursMine
//
//  Created by SutieDev on 2020/10/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class ChattingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.font = UIFont(name: "NanumBarunGothic", size: 14.0)
            header.backgroundColor = #colorLiteral(red: 1, green: 0.9254901961, blue: 0.768627451, alpha: 1)
        }
    }
}
