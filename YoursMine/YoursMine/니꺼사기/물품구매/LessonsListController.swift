//
//  LessonsListController.swift
//  YoursMine
//
//  Created by sutie on 2020/09/10.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class LessonsListController: UIViewController {
    static let name = "LessonsListController"

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

extension LessonsListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let lessonsListCell = tableView.dequeueReusableCell(withIdentifier: LessonsListCell.name, for: indexPath) as? LessonsListCell {
            return lessonsListCell
        }
        
        return UITableViewCell()
    }
}
