//
//  BuyingMainViewController.swift
//  YoursMine
//
//  Created by SutieDev on 2020/09/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class BuyingMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        readLocalFile(fileName: "product")
    }
    
    private func readLocalFile(fileName: String) {
        var json: Dictionary<String, Any>?
        let urlPath = Bundle.main.path(forResource: fileName, ofType: "json")
        do {
            print("urlPath = \(urlPath)")
            // Getting data from JSON file using the file URL
            guard let urlPath = urlPath else {
                return
            }
            let url = URL(fileURLWithPath: urlPath)
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? Dictionary
            
            let productArr = json?["SellingProducts"] as! [AnyObject]
            
            print("productArr = \(productArr)")
            
        } catch {
            // Handle error here
            print("data not found")
            print(error)
        }
    }
}
