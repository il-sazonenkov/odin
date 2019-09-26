//
//  Users.swift
//  VK
//
//  Created by Илья on 24/09/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import Foundation



//class Response: NSObject, Decodable {
//    var user = User()
//}


  
class User: NSObject, Decodable {
    dynamic var userID = 0
    dynamic var firstName = ""
    dynamic var lastName = ""
    
    enum CodingKeys: String, CodingKey {
        //case response
        case items
    }
    
    enum ItemsKeys: String, CodingKey {
        //case items
        case id
        case first_name
        case last_name
    }
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
       // self.items = try values.decode([User].self, forKey: .response)
        var infoUsers = try values.nestedUnkeyedContainer(forKey: .items)
        let info = try infoUsers.nestedContainer(keyedBy: ItemsKeys.self)
        self.userID = try info.decode(Int.self, forKey: .id)
        self.firstName = try info.decode(String.self, forKey: .first_name)
        self.lastName = try info.decode(String.self, forKey: .last_name)
        
    }
}

//класс UsersRespouce будет представлять верхнеуровневый объект json-ответа.
class UsersResponse: Decodable {
    let itemsUsers: [UserList]
}
