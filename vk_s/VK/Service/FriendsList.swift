//
//  FriendsList.swift
//  VK
//
//  Created by Илья on 19/09/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//
//
import UIKit
import Alamofire
//
//
//
class FriendsList: VKLoginFormConroller {
    // базовый URL сервиса+метод
    let baseUrl = "https://api.vk.com/method/friends.get"
    // метод для загрузки данных
    func loadFriendsList(){
        // token
        let tokenForRequest = Session.instanceSession
        // ID
        let idForRequest = Session.instanceSession.userId
        // параметры
        let parameters: Parameters = [
            "user_id": idForRequest,
            "order": "hints",
            "list_id": "",
            "count": "3",
            "offset": "5",
            "fields": "city,domain",
            "name_case": "nom",
            "ref": "",
            "access_token": tokenForRequest.token,
            "v": "5.101"
        ]
        // составляем URL из базового адреса сервиса и конкретного пути к ресурсу
        let url = baseUrl
        // делаем запрос
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value ?? "value is empty")
        }
    }
}

