//
//  SellingHistoryController.swift
//  YoursMine
//
//  Created by SutieDev on 2020/10/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class SellingHistoryController: MyHistorySuperController {
    static let name = "SellingHistoryController"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension SellingHistoryController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
