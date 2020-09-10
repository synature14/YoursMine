//
//  BuyingMainViewController.swift
//  YoursMine
//
//  Created by SutieDev on 2020/09/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class Category {
    var title: String
    var productType: ProductCategory
    var didSelected: Bool
    
    init(title: String, productType: ProductCategory) {
        self.title = title
        self.productType = productType
        self.didSelected = false
    }
}

class BuyingMainViewController: UIViewController {
    var productArr: [Product] = []
    private let categoryArr = [Category(title: "물품 구매", productType: .물건),
                               Category(title: "재능 구매", productType: .재능),
                               Category(title: "나눔 경매", productType: .나눔),
                               Category(title: "공구", productType: .공구)]
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readLocalFile(fileName: "item")
        registerCells()
        
        if let layout = listCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.minimumLineSpacing = 0
            layout.estimatedItemSize = listCollectionView.contentSize
            layout.scrollDirection = .horizontal
        }
    }
    
    private func registerCells() {
        let productSellingCell = UINib(nibName: ProductSellingCell.name, bundle: nil)
        listCollectionView.register(productSellingCell, forCellWithReuseIdentifier: ProductSellingCell.name)
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
        return categoryArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            if let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.name, for: indexPath) as? CategoryCell {
                categoryCell.setCategory(categoryArr[indexPath.item])
            }
            
        case listCollectionView:
            if let productSellingCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductSellingCell.name, for: indexPath) as? ProductSellingCell {
                      return productSellingCell
                  }
        default:
            break
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView != categoryCollectionView {
            return
        }
        
        if (collectionView.cellForItem(at: indexPath) as? CategoryCell) != nil {
            categoryArr.forEach { $0.didSelected = false }
            categoryArr[indexPath.item].didSelected = true
        }
    }
}
