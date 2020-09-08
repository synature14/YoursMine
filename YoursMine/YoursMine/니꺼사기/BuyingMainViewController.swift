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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readLocalFile(fileName: "item")
        registerCells()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.minimumLineSpacing = 0
            layout.estimatedItemSize = collectionView.contentSize
            layout.scrollDirection = .horizontal
        }
    }
    
    private func registerCells() {
        let productSellingCell = UINib(nibName: ProductSellingCell.name, bundle: nil)
        collectionView.register(productSellingCell, forCellWithReuseIdentifier: ProductSellingCell.name)
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

extension BuyingMainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let productSellingCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductSellingCell.name, for: indexPath) as? ProductSellingCell {
            return productSellingCell
        }
        
        return UICollectionViewCell()
    }
}
