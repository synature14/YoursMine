//
//  User.swift
//  YoursMine
//
//  Created by SutieDev on 2020/09/07.
//  Copyright © 2020 developers. All rights reserved.
//

import Foundation

struct User {
    enum CodingKeys: String,CodingKey {
        case id
        case name
        case employeeNum
        case grade
        case point
        case company
    }
    
    var id: String! 
    var name: String!           // 이름
    var employeeNum: String!    // 사번
    var grade: Grade!
    private var point: String!
    var company: Company!
}

extension User: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        employeeNum = try container.decode(String.self, forKey: .employeeNum)
        grade = try container.decode(Grade.self, forKey: .grade)
        point = try container.decode(String.self, forKey: .point)
        company = try container.decode(Company.self, forKey: .company)
        
    }
}


enum Grade: Int, Decodable {
    case 일반판매자 = 0
    case 리뷰왕 = 1
    case 우수판매자 = 2
}

enum Company: String, Decodable {
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
