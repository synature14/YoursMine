//
//  LessonsListController.swift
//  YoursMine
//
//  Created by sutie on 2020/09/10.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class LessonsListController: ItemListSuperController {
    static let name = "LessonsListController"
    private var itemArray: [Product] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        let lessonsListCell = UINib(nibName: LessonsListCell.name, bundle: nil)
        tableView.register(lessonsListCell, forCellReuseIdentifier: LessonsListCell.name)
        tableView.contentInset.bottom = 100
    }

    override func setData(_ productArr: [Product]) {
        self.itemArray = productArr
    }
}

extension LessonsListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemArray[indexPath.row]
        if let lessonsListCell = tableView.dequeueReusableCell(withIdentifier: LessonsListCell.name, for: indexPath) as? LessonsListCell {
            lessonsListCell.setItem(item)
            return lessonsListCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
