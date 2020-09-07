//
//  User.swift
//  YoursMine
//
//  Created by SutieDev on 2020/09/07.
//  Copyright © 2020 developers. All rights reserved.
//

import Foundation

class User {
    var id: String
    var grade: Grade
    private var point: Double
    var name: String
    var company: Company
}

enum Grade {
    case 우수판매자
    case 일반판매자
    case 리뷰왕
}

