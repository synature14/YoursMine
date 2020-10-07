//
//  BuyingHistoryController.swift
//  YoursMine
//
//  Created by SutieDev on 2020/10/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class BuyingHistoryController: UIViewController {
    static let name = "BuyingHistoryController"

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}


extension BuyingHistoryController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

