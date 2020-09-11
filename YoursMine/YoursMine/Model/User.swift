//
//  User.swift
//  YoursMine
//
//  Created by SutieDev on 2020/09/07.
//  Copyright © 2020 developers. All rights reserved.
//

import Foundation

class User {
    var id: String! 
    var name: String!           // 이름
    var employeeNum: String!    // 사번
    var grade: Grade!
    private var point: Double!
    var company: Company!
}

enum Grade {
    case 일반판매자
    case 리뷰왕
    case 우수판매자
}

enum Company: String {
    case 하나금융지주
    case 하나은행
    case 하나카드
    case 하나금융투자
    case 하나생명
    case 하나금융티아이
    case 하나캐피탈
    case 하나손해보험
    case 하나저축은행
    case 하나선물
    case 하나자산신탁
}
