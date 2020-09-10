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
        
        if productType == .물건 {
            self.didSelected = true
        } else {
            self.didSelected = false
        }
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
            layout.minimumLineSpacing = 0
            layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width,
                                              height: 520)
            layout.scrollDirection = .horizontal
        }
        
        if let categoryCellLayout = categoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            categoryCellLayout.estimatedItemSize = CGSize(width: 90, height: 40)
            categoryCellLayout.scrollDirection = .horizontal
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
                return categoryCell
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
            setSelectedCategoryCell(indexPath.item)
            
            // ProductSellingCell도 scrollToItemAt:
            listCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView != listCollectionView {
            return
        }

        guard let layout = listCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
        var item: Int = 0
        if velocity.x > 0 {
            item = Int(round(estimatedIndex))
        }
//        } else if velocity.x < 0 {
//            item = Int(floor(estimatedIndex))
//        } else {
//            item = Int(round(estimatedIndex))
//        }

        print("item = \(item)")
        setSelectedCategoryCell(item)
        categoryCollectionView.reloadData()
        categoryCollectionView.scrollToItem(at: IndexPath(item: item, section: 0), at: .right, animated: true)
        
        targetContentOffset.pointee = CGPoint(x: CGFloat(item) * cellWidthIncludingSpacing, y: 0)
    }
    
    func setSelectedCategoryCell(_ item: Int) {
        categoryArr.forEach { $0.didSelected = false }
        categoryArr[item].didSelected = true
        DispatchQueue.main.async {
            self.categoryCollectionView.reloadData()
        }
    }
}
