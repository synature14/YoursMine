//
//  SellingHistoryCellViewModel.swift
//  YoursMine
//
//  Created by SutieDev on 2020/10/07.
//  Copyright © 2020 developers. All rights reserved.
//

import Foundation

enum ListCellType {
    case auctionListCell    // 경매
    case groupBuyingCell    // 
}

class SellingHistoryCellViewModel {
    var productArr: [Product] = []
    var cellType: ListCellType?
}
