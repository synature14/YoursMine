//
//  UserManager.swift
//  YoursMine
//
//  Created by SutieDev on 2020/09/17.
//  Copyright © 2020 developers. All rights reserved.
//

import Foundation

class UserManager {

    static let shared = UserManager()
    var userArr: [User] = []
    
    private func readLocalFile() -> [User] {
        let fileName = "Users"
        let urlPath = Bundle.main.path(forResource: fileName, ofType: "json")
        do {
            guard let urlPath = urlPath else {
                return []
            }
            let url = URL(fileURLWithPath: urlPath)
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            let dataModel = try JSONDecoder().decode([User].self, from: data)
            
            UserManager.shared.userArr = dataModel
            return dataModel
        } catch {
            print(error)
        }
        return []
    }
    
    func searchUser(userID: String) -> User? {
        var userArr: [User] = []
        var user: User?
        let queue = DispatchQueue(label: "UserParsing") // serial 큐
        
        if UserManager.shared.userArr.count < 1 {
            userArr = self.readLocalFile()
        } else {
            userArr = UserManager.shared.userArr
        }
        user = userArr.filter { $0.id == userID }.first
        return user
    }
}
