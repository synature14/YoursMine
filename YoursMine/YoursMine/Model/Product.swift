//
//  Product.swift
//  YoursMine
//
//  Created by SutieDev on 2020/09/07.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit

class Product: NSObject {
    var sellerID: String
    var buyerID: String?
    var price: String
    var location: Location
    var itemContent: ItemContent
    var category: ProductCategory
}

struct ItemContent {
    var explain: String
    var image: UIImage
}

enum ProductCategory {
    case 물건
    case 재능
    case 나눔
}

enum Location {
    case 명동
    case 을지로
    case 청라
    case 경기
    case 인천
    case 강원
    case 대전
    case 대구
    case 부산
    case 경주
    case 광주
    case 여수
    case 제주
}


