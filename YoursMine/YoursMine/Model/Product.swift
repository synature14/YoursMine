//
//  Product.swift
//  YoursMine
//
//  Created by SutieDev on 2020/09/07.
//  Copyright © 2020 developers. All rights reserved.
//

import Foundation
import UIKit


struct Product {
    enum CodingKeys: String,CodingKey {
        case sellerID
        case buyerID
        case price
        case location
        case itemContent
        case category
        case nLikes
        case nChattings
    }
    
    var sellerID: String!
    var buyerID: String?
    var price: String!
    var location: Location!
    var itemContent: ItemContent!
    var category: ProductCategory!
    var nLikes: String!
    var nChattings: String!
    

//    convenience init(fromDict dictionary: [String:Any]) {
//        sellerID = dictionary["sellerID"] as? String
//        buyerID = dictionary["buyerID"] as? String
//        price = dictionary["price"] as? String
//        location = Location(rawValue: dictionary["location"] as? String ?? "서울")
//        guard let itemDic = dictionary["itemContent"] as? [String: Any] else {
//            return
//        }
//        itemContent = ItemContent(explain: itemDic["explain"] as? String ?? "",
//                                  image: itemDic["image"] as? UIImage)
//
//        category = ProductCategory(rawValue: dictionary["category"] as? String ?? "1")
//    }

//    required init?(coder: NSCoder) {
//        sellerID = coder.decodeObject(forKey: "sellerID") as? String
//        buyerID = coder.decodeObject(forKey: "buyerID") as? String
//        price = coder.decodeObject(forKey: "price") as? String
//        location = Location(rawValue: coder.decodeObject(forKey: "location") as? String ?? "서울")
//
//        guard let itemDic = coder.decodeObject(forKey: "menuId") as? [String: Any] else {
//            return
//        }
//        itemContent = ItemContent(explain: itemDic["explain"] as? String ?? "",
//                                  image: itemDic["image"] as? UIImage)
//        category = ProductCategory(rawValue: coder.decodeObject(forKey: "category") as? String ?? "1")
//    }
}

extension Product: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sellerID = try container.decode(String.self, forKey: .sellerID)
        buyerID = try container.decode(String.self, forKey: .buyerID)
        price = try container.decode(String.self, forKey: .price)
        location = try container.decode(Location.self, forKey: .location)
        itemContent = try container.decode(ItemContent.self, forKey: .itemContent)
        category = try container.decode(ProductCategory.self, forKey: .category)
        nLikes = try container.decode(String.self, forKey: .nLikes)
        nChattings = try container.decode(String.self, forKey: .nChattings)
    }
}

//extension Product: NSCoding {
//    func encode(with coder: NSCoder) {
//        if sellerID != nil{
//            coder.encode(sellerID, forKey: "sellerID")
//        }
//        if buyerID != nil{
//            coder.encode(buyerID, forKey: "buyerID")
//        }
//        if price != nil{
//            coder.encode(price, forKey: "price")
//        }
//        if location != nil{
//            coder.encode(location, forKey: "location")
//        }
//        if itemContent != nil{
//            coder.encode(itemContent, forKey: "itemContent")
//        }
//        if category != nil{
//            coder.encode(category, forKey: "category")
//        }
//    }
//
//
//    private func parse(jsonData: Data) -> Product {
//        do {
//            let decodedData = try JSONDecoder().decode(Product.self, from: jsonData)
//
//            print("sellerID: ", sellerID)
//            print("location: ", location)
//            print("=======================")
//        } catch {
//            print("decode error")
//        }
//    }
//}

struct ItemContent: Decodable {
    enum CodingKeys: String, CodingKey {
        case explain
        case image
    }
    var explain: String = ""
    var image: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        explain = try container.decode(String.self, forKey: .explain)
        image = try container.decode(String.self, forKey: .image)
    }
}

enum ProductCategory: String, Decodable {
    case 물건 = "1"
    case 재능 = "2"
    case 나눔 = "3"
    case 공구 = "4"
}

enum Location: String, Decodable {
    case 서울 = "서울"
    case 명동 = "명동"
    case 을지로 = "을지로"
    case 청라 = "청라"
    case 경기 = "경기"
    case 인천 = "인천"
    case 강원 = "강원"
    case 대전 = "대전"
    case 대구 = "대구"
    case 부산 = "부산"
    case 경주 = "경주"
    case 광주 = "광주"
    case 여수 = "여수"
    case 제주 = "제주"
}


