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
    private let categoryArr = [Category(title: "물품 구매", productType: .물건),
                               Category(title: "재능 구매", productType: .재능),
                               Category(title: "나눔 경매", productType: .나눔),
                               Category(title: "공구", productType: .공구)]
    var pageVC: BuyPageViewController!
    var searchingLocationIndex: Int = 1
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet var searchView: UIView!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet var pickerContainerView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView.frame = CGRect(x: 0, y: 0,
                                  width: UIScreen.main.bounds.width, height: self.view.frame.height)
        pickerContainerView.frame = CGRect(x: 0, y: 0,
                                           width: UIScreen.main.bounds.width, height: self.view.frame.height)
        
        readLocalFile(fileName: "item")
        
        
        if let categoryCellLayout = categoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            categoryCellLayout.estimatedItemSize = CGSize(width: 90, height: 40)
            categoryCellLayout.scrollDirection = .horizontal
        }
    }
    
    private func readLocalFile(fileName: String) {
        let urlPath = Bundle.main.path(forResource: fileName, ofType: "json")
        do {
            guard let urlPath = urlPath else {
                return
            }
            let url = URL(fileURLWithPath: urlPath)
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            let dataModel = try JSONDecoder().decode([Product].self, from: data)
            
            productArr = dataModel
            setPageVC()
        } catch {
            print(error)
        }
    }
    
    private func filterItems(category: ProductCategory) -> [Product] {
        return productArr.filter { $0.category == category }
    }
    
    private func setPageVC() {
        if let pageVC = self.children[0] as? BuyPageViewController {
            self.pageVC = pageVC
            self.pageVC.pageDelegate = self
            self.pageVC.itemArray = productArr
            
            for i in 1...4 {
                if let listVC = pageVC.VCArray[i-1] as? ItemListSuperController {
                    let filetered = filterItems(category: ProductCategory(rawValue: "\(i)") ?? .물건)
                    listVC.setData(filetered)
                }
            }
        }
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        self.view.addSubview(searchView)
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancelSearchButtonTapped(_ sender: Any) {
        textField.resignFirstResponder()
        self.searchView.removeFromSuperview()
    }
    
    // Picker뷰
    @IBAction func locationSettingButtonTapped(_ sender: Any) {
        let mainVC = self.navigationController?.parent as? MainViewController
        mainVC!.hideTabBar()
        pickerView.selectRow(searchingLocationIndex, inComponent: 0, animated: true)
        self.view.addSubview(pickerContainerView)
    }
    
    @IBAction func dimViewTapped() {
        self.pickerContainerView.removeFromSuperview()
        let mainVC = self.navigationController?.parent as? MainViewController
        mainVC!.showTabBar()
    }
    
    @IBAction func pickerChangeButtonTapped(_ sender: Any) {
        locationLabel.text = Location.allCases[searchingLocationIndex].rawValue
        dimViewTapped()
    }
    
}

extension BuyingMainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Location.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  Location.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.searchingLocationIndex = row
    }
}

extension BuyingMainViewController: PageIndexDelegate {
    func selectMenuItem(pageIndex: Int) {
        self.setSelectedCategoryCell(pageIndex)
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
            self.pageVC.goToViewController(indexPath.item)
            // ProductSellingCell도 scrollToItemAt:
        }
    }
    
    func setSelectedCategoryCell(_ item: Int) {
        categoryArr.forEach { $0.didSelected = false }
        categoryArr[item].didSelected = true
        DispatchQueue.main.async {
            self.categoryCollectionView.reloadData()
        }
    }
}
