//
//  BuyingMainViewController.swift
//  YoursMine
//
//  Created by SutieDev on 2020/09/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class BuyingMainViewController: UIViewController {
    var productArr: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readLocalFile(fileName: "item")
    }
    
    private func readLocalFile(fileName: String) {
        let urlPath = Bundle.main.path(forResource: fileName, ofType: "json")
        do {

            guard let urlPath = urlPath else {
                return
            }
            let url = URL(fileURLWithPath: urlPath)
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
//            json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? Dictionary

            let dataModel = try JSONDecoder().decode([Product].self, from: data)
            productArr = dataModel
        } catch {
            print(error)
        }
    }
}
