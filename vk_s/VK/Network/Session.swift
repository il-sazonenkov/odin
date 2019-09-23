//
//  Session.swift
//  VK
//
//  Created by Илья on 18/09/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//
import Foundation
import UIKit
import Alamofire

class Session {
    
    //Статическая константа с экземпляром этого же класса. Таким образом, сам класс будет хранить в себе свой же единственный объект.
    static let instanceSession = Session()

    
    var token: String = "" //для хранения токена в VK,
    var userId: Int = 229776126 //для хранения идентификатора пользователя ВК.
    
    private init () {} //Приватный конструктор запретит создание экземпляров класса.


}
