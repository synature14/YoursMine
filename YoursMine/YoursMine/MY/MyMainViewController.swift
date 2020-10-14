//
//  MyMainViewController.swift
//  YoursMine
//
//  Created by SutieDev on 2020/10/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class MyMainViewController: UIViewController {

    let menuTitles = ["판매내역", "구매내역", "포인트 내역 조회", "비밀번호 재설정", "회원 탈퇴"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension MyMainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyMainCell", for: indexPath) as? MyMainCell {
            cell.setTitle(menuTitles[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
}

